package yw.basket.controller;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import yw.basket.dto.BoardDTO;
import yw.basket.dto.RequestDTO;
import yw.basket.dto.MatchDTO;
import yw.basket.dto.UserDTO;
import yw.basket.service.IMatchService;
import yw.basket.service.IRequestService;
import yw.basket.service.IUserService;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
public class RequestController {

    @Resource(name = "RequestService")
    private IRequestService requestService;

    @Resource(name = "MatchService")
    private IMatchService matchService;

    @Resource(name = "UserService")
    private IUserService userService;

    //매칭 참여 (상세)
    @PostMapping(value = "/matchReq")
    @ResponseBody
    public int matchReq(RequestDTO requestDTO, MatchDTO matchDTO, HttpSession session) throws Exception {

        //user에 세션 담기
        UserDTO user = (UserDTO) session.getAttribute("user");
        //userSeq통해서 matchRegSeq 가져옴
        requestDTO.setReqUserSeq(user.getUserSeq());
        requestDTO.setReqMatchSeq(matchDTO.getMatchSeq());


        matchDTO.setReqUserSeq(user.getUserSeq());

        //match상세 정보 가져오기
        matchDTO = matchService.matchDetail(matchDTO);
        //user상세 정보 가져오기
        UserDTO userinfo = userService.getUserInfo(user);

        log.info("matchDTO : " + matchDTO.getMatchLevel());
        log.info("UserDTO : " + userinfo.getUserLevel());

        //match레벨과 user레벨이 다른 경우
        if(!matchDTO.getMatchLevel().equals(userinfo.getUserLevel())) {
            return -1;
        }


        return requestService.matchReqSave(requestDTO);
    }

    //매칭 신청 취소
    @PostMapping(value = "/matchReqCnc")
    @ResponseBody
    public int matchReqCnc(RequestDTO requestDTO) throws Exception {
        return requestService.matchReqCncSave(requestDTO);
    }

    //매칭 참여
    @PostMapping(value = "/matchReqMain")
    @ResponseBody
    public int matchReqMain(RequestDTO requestDTO, MatchDTO matchDTO, HttpSession session) throws Exception {

        //user에 세션 담기
        UserDTO user = (UserDTO) session.getAttribute("user");
        //userSeq통해서 matchRegSeq 가져옴
        requestDTO.setReqUserSeq(user.getUserSeq());
        requestDTO.setReqMatchSeq(matchDTO.getMatchSeq());

        return requestService.matchReqSave(requestDTO);
    }



}
