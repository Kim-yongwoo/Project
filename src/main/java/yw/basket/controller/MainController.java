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

        String word1 = ApiUtil.search("스테판 커리");
        String word2 = ApiUtil.search("르브론 제임스");
        String word3 = ApiUtil.search("케빈 듀란트");
        model.addAttribute("image_link1", word1);
        model.addAttribute("image_link2", word2);
        model.addAttribute("image_link3", word3);
        model.addAttribute("matchDTOList", matchDTOList);
        return "/main";
    }

    //매칭페이지 이동
    @RequestMapping(value = "/match")
    public String userMatch() throws Exception {
        return "match/match";
    }

    //이미지 검색 API 호출
    @PostMapping(value = "/searchImageApi")
    @ResponseBody
    public String searchImageApi(String playerName) throws Exception {
        return ApiUtil.search(playerName);
    }
}
