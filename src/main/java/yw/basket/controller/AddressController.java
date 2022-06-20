package yw.basket.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import yw.basket.dto.GGInfoDTO;
import yw.basket.persistance.mapper.IAddressMapper;
import yw.basket.service.IApiService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@Controller
public class AddressController {

    @Resource(name="ApiService")
    IApiService apiService;


    @GetMapping("/getGGInfo")
    @ResponseBody
    public List<GGInfoDTO> getGGInfo() throws Exception {

        return apiService.getGGInfo();
    }


    @GetMapping("/getGroundInfo")
    @ResponseBody
    public List<String> getGroundInfo(HttpServletRequest request) throws Exception {
        String siName = request.getParameter("siName");
        log.info("siName : " + siName);

        List<String> groundInfoList = apiService.getGroundInfo(siName);

        return groundInfoList;
    }

}