package yw.basket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import yw.basket.dto.BoardDTO;
import yw.basket.service.IBoardService;
import yw.basket.service.IUserService;
import yw.basket.service.impl.BoardService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class BoardController {


    @Resource(name = "BoardService")
    private IBoardService boardService;

    @RequestMapping("/boardList")
    public String boardList(Model model) throws Exception {
        List<BoardDTO> list = boardService.selectBoardList();

        model.addAttribute("list", list);
        return "/board/boardList";

    }

    @RequestMapping("/boardWrite")		//게시글 작성 화면 호출
    public String BoardWrite() throws Exception{
        return "/board/boardWrite";
    }

    @RequestMapping("/insertBoard")		//작성된 게시글 등록 기능 메소드, html의 form 태그 action에서 입력한 주소
    public String insertBoard(BoardDTO boardDTO) throws Exception{
        boardService.insertBoard(boardDTO);
        return "/board/boardList";	//게시글 리스트로 이동
    }


   /* *//**
     * 게시판 조회
     * @param boardDTO
     * @param model
     * @return
     * @throws Exception
     *//*
    @RequestMapping(value="/boardList")
    public String boardList(@ModelAttribute("boarDTO") BoardDTO boardDTO, Model model) throws Exception{

        List<BoardDTO> list = boardService.selectBoardList(boardDTO);

        model.addAttribute("list", list);

        return "board/boardList";
    }

    *//**
     * 글쓰기 폼
     * @return
     * @throws Exception
     *//*
    @RequestMapping(value="/writeForm")
    public String writeForm() throws Exception{

        return "/board/writeForm";
    }

    *//**
     * 게시글 등록
     * @param boardDTO
     * @param model
     * @return
     * @throws Exception
     *//*
    @RequestMapping(value="/write")
    public String write(@ModelAttribute("boardDTO") BoardDTO boardDTO, Model model) throws Exception{

        boardService.insertBoard(boardDTO);

        return "redirect:/board/boardList";
    }

    *//**
     * 게시글 조회
     * @param boardDTO
     * @param model
     * @param request
     * @return
     * @throws Exception
     *//*
    @RequestMapping(value="/viewContent")
    public String viewForm(@ModelAttribute("boardDTO") BoardDTO boardDTO, Model model, HttpServletRequest request) throws Exception{

        int code = Integer.parseInt(request.getParameter("code"));
        boardDTO.setBoardCode(code);

        BoardDTO resultDTO = boardService.selectBoardByCode(boardDTO);

        model.addAttribute("result", resultDTO);

        return "board/viewForm";
    }

    *//**
     * 게시글 수정
     * @param boardDTO
     * @param model
     * @return
     * @throws Exception
     *//*
    @RequestMapping(value="/updateBoard")
    public String updateBoard(@ModelAttribute("boardDTO") BoardDTO boardDTO, Model model) throws Exception{

        try{

            boardService.updateBoard(boardDTO);

        } catch (Exception e){
            e.printStackTrace();
        }

        return "redirect:/board/boardList";

    }*/





}








