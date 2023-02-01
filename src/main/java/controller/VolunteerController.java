package controller;

import java.io.File;
import java.io.IOException;
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
		board.setBoardid("1");
		
		System.out.println(board);
		
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
		Board board = bd.boardOne(num);
		m.addAttribute("board", board);
		
		return "/volunteer/volunteerInfo";
	}
}
