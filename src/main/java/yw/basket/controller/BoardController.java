package yw.basket.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
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
    public String BoardWrite() throws Exception {
        return "/board/boardWrite";
    }

    //게시글 등록 화면
    @RequestMapping("/insertBoard")        //작성된 게시글 등록 기능 메소드, html의 form 태그 action에서 입력한 주소
    public String insertBoard(BoardDTO boardDTO, ModelMap model, HttpSession session) throws Exception {
        log.info("board Title : " + boardDTO.getBoardTitle());
        log.info("boardContents : " + boardDTO.getBoardContents());

        UserDTO user = (UserDTO) session.getAttribute("user");

        boardDTO.setBoardRegSeq(user.getUserSeq());
        boardDTO.setBoardUserName(user.getUserName());

        boardService.insertBoard(boardDTO);

        log.info(String.valueOf(boardDTO));
        log.info("<<<<<<<board boardRegSeq : " + boardDTO.getBoardRegSeq());

        model.addAttribute("msg", "글 등록 완료");
        model.addAttribute("url", "/boardList");

        return "/red";    //게시글 리스트로 이동

    }

    //게시글 조회 화면
    @RequestMapping("/boardDetail/{boardSeq}")
    public ModelAndView openBoardDetail(BoardDTO boardDTO, @PathVariable int boardSeq, ModelMap model) throws Exception {

        boardDTO.setBoardSeq(boardSeq);

        ModelAndView mv = new ModelAndView("/board/boardDetail");

        BoardDTO board = boardService.selectBoardDetail(boardDTO);

        log.info("title : " + board.getBoardTitle());
        log.info("getBoardContents : " + board.getBoardContents());
        log.info("BOARD_REG_SEQ : " + board.getBoardRegSeq());
        log.info("BOARD_REG_DATE : " + board.getBoardRegDate());

        mv.addObject("board", board);
        model.addAttribute("boardInfo", board);

        return mv;

    }


    @RequestMapping("/boardUpdate") // 프론트에서 백으로 데이터를 전송할때 사용되는 객체 => servletrequest
    public String boardUpdate(HttpServletRequest request, HttpSession session) throws Exception {

        BoardDTO pDTO = new BoardDTO();

        //시퀀스 ,, 제목, 내용 get set으로 가져오기
        String boardSeq = request.getParameter("boardSeq");
        String boardTitle = request.getParameter("boardTitle");
        String boardContents = request.getParameter("boardContents");

        log.info(boardSeq);
        log.info(boardTitle);
        log.info(boardContents);

        //시퀀스 string에서 int값으로 변환
        pDTO.setBoardSeq(Integer.parseInt(boardSeq));
        pDTO.setBoardTitle(boardTitle);
        pDTO.setBoardContents(boardContents);


        UserDTO userInfo = (UserDTO) session.getAttribute("user");

        int userSeq = userInfo.getUserSeq();

        log.info(Integer.toString(userSeq));
        pDTO.setBoardRegSeq(userSeq);

        boardService.boardUpdate(pDTO);

        return "redirect:/boardList";
    }

    @RequestMapping("/boardDelete")
    public String boardDelete(HttpServletRequest request, HttpSession session) throws Exception {
        BoardDTO pDTO = new BoardDTO();
        pDTO.setBoardSeq(Integer.parseInt(request.getParameter("boardSeq")));
        boardService.boardDelete(pDTO);
        return "redirect:/boardList";
    }


//게시글 수정폼
    /*@RequestMapping(value = "/boardUpdateForm")
    public String boardUpdateForm(@RequestParam BoardDTO boardDTO, Model model) throws Exception {
        BoardDTO data = boardService.boardUpdate(boardDTO);
        model.addAttribute("data", data);
        return "/boardUpdate";
    }*/


}



    /*//게시글 수정 화면
    @RequestMapping("/boardUpdate")
    public String boardUpdate(BoardDTO boardDTO) throws Exception {
        return "/board/boardDetail";
}
*/