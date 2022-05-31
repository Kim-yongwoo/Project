package yw.basket.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import yw.basket.dto.BoardDTO;
import yw.basket.dto.UserDTO;
import yw.basket.service.IBoardService;
import yw.basket.service.IUserService;
import yw.basket.service.impl.BoardService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

import static jdk.nashorn.internal.runtime.regexp.joni.Config.log;

@Slf4j
@Controller
public class BoardController {


    @Resource(name = "BoardService")
    private IBoardService boardService;


    //게시글 리스트 화면
    @RequestMapping("/boardList")
    public String boardList(Model model) throws Exception {

        List<BoardDTO> boardList = boardService.selectBoardList();

        model.addAttribute("boardList", boardList);
        log.info("리스트ㅡㅡㅡ" + boardList);
        return "/board/boardList";

    }

    //게시글 작성 화면
    @RequestMapping("/boardWrite")
    public String BoardWrite() throws Exception{
        return "/board/boardWrite";
    }

    //게시글 등록 화면
    @RequestMapping("/insertBoard")		//작성된 게시글 등록 기능 메소드, html의 form 태그 action에서 입력한 주소
    public String insertBoard(BoardDTO boardDTO, ModelMap model, HttpSession session) throws Exception{
        log.info("board Title : " + boardDTO.getBoardTitle());
        log.info("boardContents : " + boardDTO.getBoardContents());

        UserDTO user = (UserDTO) session.getAttribute("user");

        boardDTO.setBoardRegSeq(user.getUserSeq());
        boardService.insertBoard(boardDTO);

        log.info(String.valueOf(boardDTO));
        log.info("<<<<<<<board boardRegSeq : " + boardDTO.getBoardRegSeq());

        model.addAttribute("msg", "글 등록 완료");
        model.addAttribute("url", "/boardList");

        return "/red";	//게시글 리스트로 이동
    }

    //게시글 조회 화면

    /*//게시글 수정 화면
    @RequestMapping("/updateBoard")
    public String updateBoard(BoardDTO boardDTO) throws Exception {

    }*/

    //게시글 삭제 화면
    /*@RequestMapping("/deleteBoard")
    public String deleteBoard(BoardDTO boardDTO) throws Exception {

    }*/


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








