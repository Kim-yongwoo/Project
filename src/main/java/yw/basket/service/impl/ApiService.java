package yw.basket.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestTemplate;
import yw.basket.dto.GGInfoDTO;
import yw.basket.mapper.IMatchMapper;
import yw.basket.mapper.redis.IChatMapper;
import yw.basket.persistance.mapper.IAddressMapper;
import yw.basket.service.IApiService;
import yw.basket.util.CmmUtil;

import javax.annotation.Resource;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Slf4j
@Service("ApiService")
public class ApiService implements IApiService {

    private final IAddressMapper addressMapper;

    @Autowired
    public ApiService(IAddressMapper addressMapper) {
        this.addressMapper = addressMapper;
    }

    @Override
    public List<GGInfoDTO> getGGInfo() throws Exception {
        return addressMapper.getGGInfo();
    }

    public List<String> getGroundInfo(String siName) throws Exception {
        log.debug("test Api Start!");

        URI uri = new URI("");

        log.debug("name : " + siName);

        RestTemplate restTemplate = new RestTemplate();

        if (siName.length() > 0) {
            uri = new URI("https://openapi.gg.go.kr/PublicLivelihood?Type=JSON&KEY=1d7bad1a53734b3eb6e2a199a90fc5e0&SIGUN_NM=" + URLEncoder.encode(siName, "UTF-8"));
        } else {
            uri = new URI("https://openapi.gg.go.kr/PublicLivelihood?Type=JSON&KEY=1d7bad1a53734b3eb6e2a199a90fc5e0");
        }

        List<String> stringList = new LinkedList<>();
        try {

            HttpHeaders headers = new HttpHeaders();
            headers.set("Connection", "application/json");
            ResponseEntity<String> response = restTemplate.getForEntity(uri, String.class);

            Map<String, Object> map = new HashMap<>();

            ObjectMapper mapper = new ObjectMapper();
            map = mapper.readValue(response.getBody(), new TypeReference<Map<String, Object>>() {
            });

            List<Map<String, Object>> PublicLivelihood = (List<Map<String, Object>>) map.get("PublicLivelihood");
            List<Map<String, Object>> row = (List<Map<String, Object>>) PublicLivelihood.get(1).get("row");

            for (Map<String, Object> rowMap : row) {

                log.debug("FACLT_NM : " + rowMap.get("FACLT_NM"));
                String FACLT_NM = String.valueOf(rowMap.get("FACLT_NM")); //경기장이름
               /* String REFINE_ROADNM_ADDR = String.valueOf(rowMap.get("REFINE_ROADNM_ADDR")); //도로명주소가 존재하지않음
*/
                if (FACLT_NM.length() > 1) {
                    stringList.add(FACLT_NM);
                }
            }


        } catch (JsonProcessingException exception) {
            log.debug("JsonProcessingException : " + exception);
            exception.printStackTrace();

        } catch (HttpStatusCodeException statusCodeException) {
            int code = statusCodeException.getRawStatusCode();

            log.debug("HttpStatusCodeException : " + statusCodeException.getResponseBodyAsString());

            statusCodeException.printStackTrace();


        } catch (Exception exception) {
            log.debug("Exception : " + exception);   //


        } finally {
            log.debug("test Api End!");
            return stringList;
        }
    }
}