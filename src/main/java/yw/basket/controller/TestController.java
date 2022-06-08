package yw.basket.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import yw.basket.service.IUserService;
import yw.basket.util.ApiUtil;
import javax.annotation.Resource;


@Slf4j
@Controller
public class TestController {

    @Resource(name = "UserService")
    private IUserService userService;

    //test
    @RequestMapping(value = "/test")
    public String test() throws Exception {
        return "/test";
    }
    @RequestMapping(value = "/hi")
    public String hello() throws Exception {
        return "/hi";
    }

    @RequestMapping(value = "/hello")
    public String who() throws Exception {
        return "/hello";
    }


    @RequestMapping(value = "/Naver")
    public String naver() throws Exception {
        String word = ApiUtil.search("손흥민");
        System.out.println("결과 값 : " +word);

        return "/hello";
    }

}
