package yw.basket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import yw.basket.dto.BoardDTO;
import yw.basket.service.impl.BoardService;

import java.util.List;

@Controller
public class BoardController {

    @Autowired
    private BoardService boardService; //서비스와 연결


    @RequestMapping("/boardList") //노테이션의 값으로 주소 지정
    public String boardList(Model model) throws Exception {
        List<BoardDTO> list = boardService.selectBoardList();

        model.addAttribute("list", list);
        return "/board/boardList";

    }

    @RequestMapping("/openBoardWrite")		//게시글 작성 화면 호출
    public String openBoardWrite() throws Exception{
        return "/board/boardWrite";
    }

    @RequestMapping("/insertBoard")		//작성된 게시글 등록 기능 메소드, html의 form 태그 action에서 입력한 주소
    public String insertBoard(@ModelAttribute BoardDTO board) throws Exception{
        boardService.insertBoard(board);
        return "redirect:/boardList";	//게시글 리스트로 이동
    }


}








