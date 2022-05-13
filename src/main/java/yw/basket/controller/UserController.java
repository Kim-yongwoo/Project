package yw.basket.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import yw.basket.dto.UserDTO;
import yw.basket.service.IUserService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@Controller
public class UserController {

    @Resource(name = "UserService")
    private IUserService userService;

    /**
     * @title   : 메인 시작 URL
     * @param   : N/A
     * @return  : N/A
     */
    @GetMapping(value = "/")
    public String main() {
        return "redirect:/login";
    }

    /**
     * @title   : 로그인 페이지
     * @param   : N/A
     * @return  : login
     */
    @GetMapping(value = "/login")
    public String login() {
        return "user/login";
    }

    /**
     * @title   : 로그인 체크
     * @param   : UserDTO
     * @return  : login
     */
    @PostMapping(value = "/loginCheck")
    public String loginCheck(UserDTO userDTO) throws Exception {


        userService.loginCheck(userDTO);
        log.info("userId :: " + userDTO.getUserId());
        log.info("userPw :: " + userDTO.getUserPw());

        return "user/login";
    }

    /**
     * @title   : 회원가입 페이지
     * @param   : UserDTO
     * @return  :
     */
    @RequestMapping(value = "/userReg")
    public String userReg() throws Exception {
        return "user/reg";
    }


    /**
     * @title   : 회원가입
     * @param   : UserDTO
     * @return  :
     */
    @PostMapping(value = "/signUp")
    @ResponseBody // ajax사용하기 위한 어노테이션
    public int signUp(UserDTO userDTO, Model model) throws Exception {
        log.info("userId :: " + userDTO.getUserId());
        log.info("userPw :: " + userDTO.getUserPw());

        return userService.signUp(userDTO);
    }
}
