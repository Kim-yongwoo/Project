package yw.basket.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import yw.basket.service.IMatchService;


@Slf4j
@Controller
public class MatchController {

    private final IMatchService matchService;

    @Autowired
    public MatchController(IMatchService matchService) {
        this.matchService = matchService;
    }

    //매칭 시작
    @RequestMapping(value = "/matchSave")
    public String matchSave() throws Exception {
        return "match/matchSave";
    }


}
