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



}
