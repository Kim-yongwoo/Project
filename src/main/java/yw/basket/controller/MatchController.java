package yw.basket.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import yw.basket.dto.MatchDTO;
import yw.basket.dto.UserDTO;
import yw.basket.service.IMatchService;
import yw.basket.service.IUserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;


@Slf4j
@Controller
public class MatchController {

    @Resource(name = "MatchService")
    private IMatchService matchService;

    @Resource(name = "UserService")
    private IUserService userService;

    //매칭 생성 화면
    @RequestMapping(value = "/matchReg")
    public String matchReg(Model model, HttpSession session) throws Exception {
        //session을 통해서 user에 값을 받고 여기 user에는 세션에서 받은 id와 seq가 있다
        //getUserSeq 메소드에 user를 파라미터로 보내고 받아온 결과값을 userDTO에

       /* int userSeq = (int) session.getAttribute("user").getUserSeq();*/


        return "/match/matchReg";
    }

    //매칭 생성
    @PostMapping(value = "/matchRegSave")
    @ResponseBody
    public int matchRegSave(MatchDTO matchDTO, HttpSession session) throws Exception {
        UserDTO user = (UserDTO) session.getAttribute("user");
        matchDTO.setMatchRegSeq(user.getUserSeq());

       return matchService.matchRegSave(matchDTO);
    }


}
