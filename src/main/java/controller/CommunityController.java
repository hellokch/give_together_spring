package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
@RequestMapping("/community/*")
public class CommunityController {
	
	@Autowired
	BoardMybatisDao bd;
	

	Model m;
	HttpSession session;
	HttpServletRequest request;
	
	
	@ModelAttribute
	void init(HttpServletRequest request, Model m) {
		this.request=request;
		this.m=m;
		session = request.getSession();		
		}
	
	@RequestMapping("community")
	public String community(){
		System.out.println("To communityPage");
		return "/communityPage";
	}
	
	
	
	@RequestMapping("boardForm")
	public String boardForm() {			
		return "/community/boardForm"; 						
	}
			
			
	
	
}	




