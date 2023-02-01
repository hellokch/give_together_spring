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
	
	@RequestMapping("donation11")
	public String donation11()  {
		int limit = 3;
		
		int pageInt = 1;
		
		
		String p_type = (String) session.getAttribute("p_type");
		int boardCount = bd.boardCount(p_type);
		
		if(request.getParameter("p_type")!=null) {
			session.setAttribute("pageNum", "1");
			session.setAttribute("p_type", request.getParameter("p_type"));
		}
		if(request.getParameter("pageNum") != null) {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		List<Board> list = bd.boardList(p_type, boardCount, limit);
		
		return "/donationPage";
	}
	

	
	@RequestMapping("donationForm")
	public String donationForm () {
		String login = (String) session.getAttribute("id");
		Usergroup gro = userdao.selectOneG(login);
		m.addAttribute("gro",gro);
		return "/donation/donationForm";
	}
	
	@RequestMapping("donation")
	public String donation () {
		
		return "/donationPage";
	}
	
	
}