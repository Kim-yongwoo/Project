package yw.basket.controller;


import com.sun.org.apache.xpath.internal.operations.Mod;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import yw.basket.dto.MatchDTO;
import yw.basket.dto.UserDTO;
import yw.basket.service.IMatchService;
import yw.basket.service.IUserService;
import yw.basket.util.ApiUtil;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
public class MainController {

    private final IUserService userService;
    private final IMatchService matchService;

    @Autowired
    public MainController(IUserService userService, IMatchService matchService) {
        this.userService = userService;
        this.matchService = matchService;
    }




    @GetMapping(value = "/main")
    public String main(MatchDTO matchDTO, HttpSession session, Model model) throws Exception {

        UserDTO user = (UserDTO) session.getAttribute("user"); //세션
        matchDTO.setMatchRegSeq(user.getUserSeq());

        List<MatchDTO> matchDTOList = matchService.matchDTOList(matchDTO);

        String word = ApiUtil.search("스테판 커리");
        System.out.println("결과 값 : " +word);
        model.addAttribute("matchDTOList", matchDTOList);
        model.addAttribute("image_link", word);
        return "/main";
    }

    //매칭페이지 이동
    @RequestMapping(value = "/match")
    public String userMatch() throws Exception {
        return "match/match";
    }



}
