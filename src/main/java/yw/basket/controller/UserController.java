package yw.basket.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import yw.basket.dto.UserDTO;
import yw.basket.service.IUserService;

import javax.annotation.Resource;

@Slf4j
@Controller
public class UserController {

    @Resource(name = "UserService")
    private IUserService userService;

    /**
     * @param : N/A
     * @return : N/A
     * @title : 메인 시작 URL
     */
    @GetMapping(value = "/")
    public String start() {
        return "redirect:/login";
    }

    /**
     * @param : N/A
     * @return : login
     * @title : 로그인 페이지
     */
    @GetMapping(value = "/login")
    public String login() {
        return "user/login";
    }

    /**
     * @param : UserDTO
     * @return : login
     * @title : 로그인 체크
     */
    @PostMapping(value = "/loginCheck")
    @ResponseBody
    public int loginCheck(UserDTO userDTO) throws Exception {

        log.info("userId :: " + userDTO.getUserId());
        log.info("userPw :: " + userDTO.getUserPw());

        return userService.loginCheck(userDTO);
    }

    /**
     * @param : UserDTO
     * @return :
     * @title : 회원가입 페이지
     */
    @RequestMapping(value = "/userReg")
    public String userReg() throws Exception {
        return "user/reg";
    }


    /**
     * @param : UserDTO
     * @return :
     * @title : 회원가입
     */
    @PostMapping(value = "/signUp")
    @ResponseBody // ajax사용하기 위한 어노테이션
    public int signUp(UserDTO userDTO, Model model) throws Exception {
        log.info("userId :: " + userDTO.getUserId());
        log.info("userPw :: " + userDTO.getUserPw());

        return userService.signUp(userDTO);
    }


}
