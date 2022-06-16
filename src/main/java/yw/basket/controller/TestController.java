package yw.basket.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import netscape.javascript.JSObject;
import com.fasterxml.jackson.core.type.TypeReference;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestTemplate;
import yw.basket.dto.ApiDto;
import yw.basket.service.IUserService;
import yw.basket.util.ApiUtil;
import yw.basket.util.CmmUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;


@Slf4j
@Controller
@RequiredArgsConstructor
public class TestController {
    @Resource(name = "UserService")
    private IUserService userService;

    @RequestMapping(value = "/hi")
    public String hello() throws Exception {
        return "/hi";
    }



    @RequestMapping("/test")
    @ResponseBody
    public List<String> testApi(HttpServletRequest request) throws Exception {
        log.debug("test Api Start!");
        List<String> stringList = new LinkedList<>();

        URI uri = new URI("");

        String name = CmmUtil.nvl(request.getParameter("name"));
        log.debug("name : " + name);

        RestTemplate restTemplate = new RestTemplate();

        if (name.length() > 0) {
            log.debug("hasName : " + request.getParameter("name"));
            name = request.getParameter("name");
            uri = new URI("https://openapi.gg.go.kr/PublicLivelihood?Type=JSON&KEY=1d7bad1a53734b3eb6e2a199a90fc5e0&SIGUN_NM=" + URLEncoder.encode(name, "UTF-8"));
        } else {
            uri = new URI("https://openapi.gg.go.kr/PublicLivelihood?Type=JSON&KEY=1d7bad1a53734b3eb6e2a199a90fc5e0");
        }

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
                String FACLT_NM = String.valueOf(rowMap.get("FACLT_NM"));

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
            log.debug("Exception : " + exception);


        } finally {
            log.debug("test Api End!");
            return stringList;
        }
    }

}
