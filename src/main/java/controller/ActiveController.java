package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ActMybatisDao;
import dao.BoardMybatisDao;
import dao.UserMybatisDao;
import model.Board;
import model.Usergroup;
import model.Userperson;
import model.act;



@Controller
@RequestMapping("/act/")
public class ActiveController {
	@Autowired
	ActMybatisDao actdao;
		
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

	@RequestMapping("payment")
	public String payment(int num){
		Board board = bd.boardOne(num);
		String login = (String) session.getAttribute("id");
		String login1 = (String) session.getAttribute("kinds");
		
		if(login1 == "1") {
			Userperson userinfo = userdao.selectOneP(login);
			m.addAttribute("userinfo", userinfo);
		}else {
			Usergroup userinfo = userdao.selectOneG(login);
			m.addAttribute("userinfo", userinfo);
		}
		m.addAttribute("board",board);
		return "/activity/payment";
	}
	
	
	

}