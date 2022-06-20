package yw.basket.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import yw.basket.dto.MatchDTO;
import yw.basket.dto.RequestDTO;
import yw.basket.dto.UserDTO;
import yw.basket.service.IMatchService;
import yw.basket.service.IRequestService;
import yw.basket.service.IUserService;
import yw.basket.util.ApiUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Slf4j
@Controller
public class MatchController {

    @Resource(name = "MatchService")
    private IMatchService matchService;

    @Resource(name = "UserService")
    private IUserService userService;

    @Resource(name = "RequestService")
    private IRequestService requestService;

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
        int userSeq = user.getUserSeq();

        // 경기생성
        matchDTO.setMatchRegSeq(userSeq);
        int matchRegCnt = matchService.matchRegSave(matchDTO);

        if (matchRegCnt < 1) return 0;

        // 신청정보 저장
        RequestDTO requestDTO = new RequestDTO();
        requestDTO.setReqUserSeq(userSeq);
        requestDTO.setReqMatchSeq(matchDTO.getMatchSeq());

        int matchReqCnt = requestService.matchReqSave(requestDTO);

        if (matchRegCnt < 1) return 0;

        return 1;
    }

       //경기 상세 조회
    @RequestMapping("/matchDetail/{matchSeq}")
    public String matchDetail(MatchDTO matchDTO, Model model, HttpSession session, @PathVariable int matchSeq) throws Exception {
        UserDTO user = (UserDTO) session.getAttribute("user");

        matchDTO.setMatchSeq(matchSeq);
        matchDTO.setReqUserSeq(user.getUserSeq());
        matchDTO = matchService.matchDetail(matchDTO);
        model.addAttribute("matchDTO", matchDTO);
        return "/match/matchDetail";

    }

    //신청정보 리스트
    @RequestMapping("/reqList")
    public String reqList(MatchDTO matchDTO, RequestDTO requestDTO, HttpSession session, Model model) throws Exception {
        //user에 세션 담기
        UserDTO user = (UserDTO) session.getAttribute("user");

        matchDTO.setMatchSeq(matchDTO.getMatchSeq());
        matchDTO.setReqUserSeq(user.getUserSeq());
        matchDTO.setReqMatchSeq(matchDTO.getMatchSeq());
        matchDTO.setReqStatus(requestDTO.getReqStatus());

        String word = ApiUtil.search("스테판 커리");
        model.addAttribute("image_link", word);

        List<MatchDTO> reqList = matchService.reqList(matchDTO);

        model.addAttribute("reqList", reqList);

        return "/request/reqList";

    }

    //나의 활동
    @RequestMapping("/my")
    public String my(MatchDTO matchDTO, RequestDTO requestDTO, HttpSession session, Model model) throws Exception {
        //user에 세션 담기
        UserDTO user = (UserDTO) session.getAttribute("user");

        matchDTO.setMatchSeq(matchDTO.getMatchSeq());
        matchDTO.setReqUserSeq(user.getUserSeq());
        matchDTO.setReqMatchSeq(matchDTO.getMatchSeq());
        matchDTO.setReqStatus(requestDTO.getReqStatus());

        List<MatchDTO> my = matchService.my(matchDTO);

        model.addAttribute("reqList", my);

        return "/request/my";

    }


}
