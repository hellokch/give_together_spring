package controller;

import java.io.File;
import java.io.IOException;

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
import model.Board; 

@Controller
@RequestMapping("/donation/")
public class DonationController {
	
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
	
	@PostMapping("donationPro")
	
	public String boardPro (@RequestParam("file2") MultipartFile multipartFile, Board board) {
		//저장 path 확인
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
		String url = "/giveTogether/main";
		
		
		String boardid = (String) session.getAttribute("boardid");
		if(boardid == null) boardid = "1";
		board.setBoardid(boardid);
		
			
				System.out.println(board);
			int num = bd.insertBoard(board);
			if (num>0) {
				msg = "게시물 등록 성공";  
				url="/board/boardList";
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
}