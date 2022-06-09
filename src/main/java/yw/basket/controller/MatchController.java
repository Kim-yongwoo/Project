package yw.basket.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import yw.basket.dto.BoardDTO;
import yw.basket.dto.MatchDTO;
import yw.basket.dto.UserDTO;
import yw.basket.service.IMatchService;
import yw.basket.service.IUserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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

    /*//매치 상세
    @RequestMapping("/matchDetail/{matchSeq}")
    public ModelAndView matchDetail(MatchDTO matchDTO, @PathVariable int matchSeq, ModelMap model) throws Exception {

        matchDTO.setMatchSeq(matchSeq);

        ModelAndView mv = new ModelAndView("/match/matchDetail");

        *//*MatchDTO match = matchService.selectMatchDetail(matchDTO);*//*

        log.info("title : " + match.getMatchGmName());

        mv.addObject("match", match);
        model.addAttribute("matchDTOList", match);

        return mv;
    }*/


}
