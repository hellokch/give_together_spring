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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile; 

import dao.BoardMybatisDao;
import dao.UserMybatisDao;
import model.Board;
import model.Usergroup; 

@Controller
@RequestMapping("/donation/")
public class DonationController {
	
	@Autowired
	BoardMybatisDao bd;
	
	@Autowired
	UserMybatisDao userdao;
	
	Model m;
	HttpSession session;
	HttpServletRequest request;
	
	@ModelAttribute
	void init(HttpServletRequest request, Model m) {
		this.request = request;
		this.m=m;
		session = request.getSession();
	}
	
	
	@PostMapping("donationPro")	
	public String boardPro (@RequestParam("uploadfile") MultipartFile multipartFile, Board board) {
		String path = request.getServletContext().getRealPath("/") + "view/donation/img/";
		String filename = "";
		if (!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename());
			filename = multipartFile.getOriginalFilename();
			try {
				multipartFile.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		board.setPicture(filename);
		String msg = "게시물 등록 실패";
		String url = "/donation/donationForm";		
		System.out.println(board);
		int num = bd.insertBoard(board);
		if (num>0) {
			msg = "게시물 등록 성공";  
			url="/donation/donation";
		}		
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";
	}
	
	@RequestMapping("donation")
	public String donation()  throws Exception {
		System.out.println("To donationPage");
		/*
		List<Board> list=userdao.giveBoard();
		System.out.println("@@@"+list);
		*/
		return "/donationPage";
	}
	
	@RequestMapping("donationList")		//boardList는 건드릴게 딱히 없단다
	public String boardList () {
		//100개 order by 최근 num desc
		int limit = 10;	//한 page당 게시물 갯수
//		http://localhost:9080/kic_model2pro/board/boardList?boardid=3
		// boardid 파라미터로 넘어 왔을때만 session에 저장한다.
		
		
		if (request.getParameter("boardid") != null) {
			session.setAttribute("pageNum","1");	//boardid 수정시에 pageNum을 1로 해야함
			session.setAttribute("boardid", request.getParameter("boardid")); 
		}
		
		String boardid = (String) session.getAttribute("boardid");
		if (boardid == null)		boardid = "1";
		
		//pageNum이 파라메터로 넘어왔을때만 session에 저장 한다
		if (request.getParameter("pageNum") != null) {
			session.setAttribute("pageNum", request.getParameter("pageNum"));	}
		String pageNum = (String) session.getAttribute("pageNum");
		if(pageNum == null) pageNum = "1";
		
		int pageInt = Integer.parseInt(pageNum);	//현재 page
		
		
		String boardName = "";
		switch(boardid) {
			case "1" : boardName = "봉사"; break;
			case "2" : boardName = "기부"; break;
			case "3" : boardName = "펀딩"; break;
		}
		
		int boardCount = bd.boardCount(boardid);
		List<Board> list=bd.boardList(boardid, pageInt, limit);
		
		int bottomLine = 3; // 하단의 page 표시 수
		/*
		 pageInt
		 
		 1	:	1,2,3
		 2	:	1,2,3
		 3	:	1,2,3
		 4	:	4,5,6
		 ~
		 7	:	7,8,9
		 */
		
		int startPage = (pageInt-1)/bottomLine*bottomLine+1;
		int endPage = startPage + bottomLine -1;
		
		int maxPage = (boardCount/limit) + (boardCount%limit==0?0:1);	//총 page 수
		
		if (maxPage < endPage) 	endPage=maxPage;
		
		
		
		
		
		m.addAttribute("boardCount", boardCount);
		m.addAttribute("boardName", boardName);
		m.addAttribute("list", list);
		m.addAttribute("boardid", boardid);
		m.addAttribute("pageInt", pageInt);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("maxPage", maxPage);
		
		
		return "/donation/donationList";	
	}
	
	
	@RequestMapping("donationForm")
	public String donationForm () {
		String login = (String) session.getAttribute("id");
		Usergroup gro = userdao.selectOneG(login);
		m.addAttribute("gro",gro);
		return "/donation/donationForm";
	}
	
	@RequestMapping("donationFormPro")
	public String donationFormPro () {
		
		return "/donation/donation";
	}
	
	
}