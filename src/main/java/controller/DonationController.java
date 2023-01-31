package controller;

import java.io.File;
import java.io.IOException;

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