package controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardMybatisDao;
import model.Board;

@Controller
@RequestMapping("/volunteer/")
public class VolunteerController {
	
	@Autowired
	BoardMybatisDao bd;
	

	Model m;
	HttpSession session;
	HttpServletRequest request;
	
	@ModelAttribute
	void init(HttpServletRequest request, Model m) {
		this.request = request;
		this.m=m;
		session = request.getSession();
	}
	
	@RequestMapping("volunteerPro")
	public String volunteerPro(@RequestParam("uploadfile") MultipartFile multipartfile, Board board) {
		
		System.out.println("request ok");
		
		
		String login = (String) session.getAttribute("id");
		String path = request.getServletContext().getRealPath("/") + "view/volunteer/img/";
		String filename = null;
		
		if(!multipartfile.isEmpty()) {
			File file = new File(path, multipartfile.getOriginalFilename());
			filename = multipartfile.getOriginalFilename();
			try {
				multipartfile.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		board.setPicture(filename);
		
		
		String msg = "게시글 등록 실패";
		String url = "/volunteer/volunteerList";
		
		System.out.println(board);
		board.setP_type("1");
		
		board.setAct_time(board.getStart_t() + ":00~" + board.getEnd_t() + ":00");
		board.setId((String) session.getAttribute("id"));
		board.setBoardid("1");
		
		System.out.println("Before insertBoard: " + board);
		
		int num = bd.insertBoard(board);
		if(num > 0) {
			msg = "게시물 등록 성공";
			url = "/volunteer/volunteerList";
		}
		
		System.out.println(board);
		
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		
		return "/alert";
	}
	
	@RequestMapping("volunteerList")
	public String volunteers() {
		//100개 order by로 최근 num desc
		int limit = 2; //한 page당 게시물 개수
		String p_type = "1";
		
		if(request.getParameter("pageNum") != null) {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		String pageNum = (String) session.getAttribute("pageNum");
		if(pageNum == null) pageNum = "1";
		
		int pageInt = Integer.parseInt(pageNum);
		int bottomLine = 3; //하단 페이지 넘기기 숫자
		
		/*
		 *	pageInt
		 *	1:	123 
		 *	2:	123
		 *	3:	123
		 *	4:	456
		 *	~
		 *	7:
		 */
		
		int startPage = (pageInt - 1) / bottomLine * bottomLine +1;
		int endPage = startPage + bottomLine - 1;
		
		String boardName = "";
		switch(p_type) {
			case "1": boardName = "봉사"; break;
			case "2": boardName = "기부"; break;
			case "3": boardName = "펀딩"; break;
		}
		int boardCount = bd.boardCount(p_type);
		
		int maxPage = (boardCount/limit) + (boardCount%limit == 0 ? 0 : 1);
		if (maxPage < endPage) endPage = maxPage;
		
		List<Board> list = bd.boardList(p_type, pageInt, limit);
		
		System.out.println("startPage = " + startPage);
		
		m.addAttribute("boardCount", boardCount);
		m.addAttribute("boardName", boardName);
		m.addAttribute("list", list);
		m.addAttribute("boardid", p_type);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("pageInt", pageInt);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("maxPage", maxPage);
		
		for (Board board : list) {
			System.out.println(board);
		}
		
		return "/volunteer/volunteerList";
	}
	
	@RequestMapping("volunteerForm")
	public String volunteerForm() {
		return "/volunteer/volunteerForm";
	}

	@RequestMapping("volunteerInfo")
	public String volunteerInfo(int num) {
		String id = (String) session.getAttribute("id");
		String kinds = (String) session.getAttribute("kinds");
		
		System.out.println("id = " + id + ", kinds = " + kinds);
		
		Board board = bd.boardOne(num);
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		m.addAttribute("v_start",simpleDateFormat.format(board.getV_start()));
		m.addAttribute("v_end",simpleDateFormat.format(board.getV_end()));
		m.addAttribute("end_date",simpleDateFormat.format(board.getEnd_date()));
		m.addAttribute("board", board);
		
		return "/volunteer/volunteerInfo";
	}
	
	@RequestMapping("volunteerUpdateForm")
	public String volunteerUpdateForm(int num) {
		Board board = bd.boardOne(num);
		m.addAttribute("board", board);
		String time = board.getAct_time();
		String times[] = time.split("~");
		board.setStart_t(times[0].split(":")[0]);
		board.setEnd_t(times[1].split(":")[0]);
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		m.addAttribute("v_start",simpleDateFormat.format(board.getV_start()));
		m.addAttribute("v_end",simpleDateFormat.format(board.getV_end()));
		m.addAttribute("end_date",simpleDateFormat.format(board.getEnd_date()));
		
		System.out.println(times[0].split(":")[0] + times[1].split(":")[0]);
		
		m.addAttribute("board", board);
		
		return "/volunteer/volunteerUpdateForm";
	}
	
	@RequestMapping("volunteerUpdatePro")
	public String vaolunteerUpdatePro(@RequestParam("f") MultipartFile multipartfile, Board board) {
		
		Board dbboard = bd.boardOne(board.getIndex_num());
		
		String path = request.getServletContext().getRealPath("/") + "view/board/img/";
		if(!multipartfile.isEmpty()) {
			File file = new File(path, multipartfile.getOriginalFilename());
			String filename = multipartfile.getOriginalFilename();
			board.setPicture(filename);
			try {
				multipartfile.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			board.setPicture(dbboard.getPicture());
		}
		
		board.setAct_time(board.getStart_t() + ":00~" + board.getEnd_t() + ":00");
		
		String url = "/volunteer/volunteerInfo?num=" + board.getIndex_num();
		String msg = "";
		if(bd.boardUpdate(board)>0) {
			msg = "수정 완료";
			url = "/volunteer/volunteerInfo?num=" + board.getIndex_num();
		}else {
			msg = "수정 실패";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		
		return "/alert";
	}
	
	@RequestMapping("volunteerDeletePro")
	public String volunteerDeleteForm(int num) {
		
		String msg = "비밀번호가 다릅니다.";
		String url = "/board/boardDeleteForm?num=" + num;
		
		System.out.println(num);
		
		Board board = bd.boardOne(num);
		
		if(bd.boardDelete(num) > 0) {
			msg = "삭제되었습니다.";
			url = "/volunteer/volunteerList";
		}
		else {

			msg = "board delete error";
			url = "/volunteer/volunteerList";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		
		return "/alert";
	}
}
