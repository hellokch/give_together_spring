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
		m.addAttribute("board",board);
		return "/activity/payment";
	}
	
	
	@RequestMapping("paymentPro")
	public String paymentPro(act active, int act_number, int act_pay)throws Exception {
		int count = actdao.insertact(active);
		String msg="";
		String url="";
		Board board = bd.boardOne(act_number);
		int raise = board.getRaised();
		
		
		if(count>0) {
			int n_raise = raise + act_pay;
			actdao.raiseUpdate(n_raise, act_number);
			msg = "결제가 완료 되었습니다.";
			url = "/donation/donationInfo?num=" + act_number;
		}else {
			msg = "결제에 실패 했습니다.";
			url = "/act/payment";			
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";
	}
	
	

}