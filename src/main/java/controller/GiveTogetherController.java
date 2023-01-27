package controller;

import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.UserMybatisDao;

import model.Board;
import model.Usergroup;
import model.Userperson;

@Controller
@RequestMapping("/giveTogether/")
public class GiveTogetherController {
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
	
	@RequestMapping("main")
	public String main(){
		System.out.println("request ok");
		return "/mainPage";
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
	
	@RequestMapping("funding")
	public String funding(){
		System.out.println("To fundingPage");
		return "/fundingPage";
	}
	
	@RequestMapping("volunteer")
	public String voluteer(){
		System.out.println("To voluteerPage");
		return "/volunteer/volunteerForm";
	}
	
	@RequestMapping("loginForm")
	public String loginForm(){
		System.out.println("To loginForm");
		return "/user/loginForm";
	}
	
	@RequestMapping("joinForm")
	public String joinForm(){
		System.out.println("To joinForm");
		return "/user/joinForPerson";
	}
	
	@RequestMapping("joinForGroup")
	public String joinForGroup(){
		System.out.println("To joinFormForGroup");
		return "/user/joinForGroup";
	}
	
	@RequestMapping("joinUserGroupPro")
	public String joinUserGroupPro()throws Exception {
		
		System.out.println("joinUserGroupPro");	
		
		Usergroup group = new Usergroup();
		group.setId(request.getParameter("id"));
		group.setKinds(request.getParameter("kinds"));
		group.setPass(request.getParameter("pass"));
		group.setTel(request.getParameter("tel"));
		group.setName(request.getParameter("name"));
		group.setEmail(request.getParameter("email"));
		group.setLocation(request.getParameter("location"));
		group.setLocation1(request.getParameter("location1"));
		group.setP_name(request.getParameter("p_name"));
		group.setIntro(request.getParameter("intro"));
		group.setPicture(request.getParameter("picture"));
		
		int count = userdao.insertUsergroup(group);
		String msg="";
		String url="";
		
		if(count>0) {
			msg = group.getP_name() + "님의 가입이 완료되었습니다.";
			url = "/user/loginForm";
		}else {
			msg = "회원가입에 실패 했습니다.";
			url = "/user/joinForGroup";			
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/alert";
	}
	
	@RequestMapping("joinForPerson")
	public String joinForPerson(){
		System.out.println("To joinFormForPerson");
		return "/user/joinForPerson";
	}
	
	@RequestMapping("joinUserPersonPro")
	public String joinUserPersonPro()throws Exception {
		System.out.println("joinUserPersonPro");
		
		Userperson person = new Userperson();
		person.setId(request.getParameter("id"));
		person.setKinds(request.getParameter("kinds"));
		person.setPass(request.getParameter("pass"));
		person.setTel(request.getParameter("tel"));
		person.setName(request.getParameter("name"));
		person.setEmail(request.getParameter("email"));
		person.setLocation(request.getParameter("location"));
		person.setLocation1(request.getParameter("location1"));
		person.setNickname(request.getParameter("nickname"));
		person.setGender(Integer.parseInt(request.getParameter("gender")));
		
		int count = userdao.insertUserperson(person);
		String msg="";
		String url="";
		
		if(count>0) {
			msg = person.getName() + "님의 가입이 완료되었습니다.";
			url = "/giveTogether/loginForm";
		}else {
			msg = "회원가입에 실패 했습니다.";
			url = "/giveTogether/joinForPerson";			
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/alert";
	}
	
	@RequestMapping("userPersonInfo")
	public String userPersonInfo(){
		System.out.println("To joinFormForPerson");
		return "/mypage/userPersonInfo";
	}
	
}
