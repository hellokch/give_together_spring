package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.UserMybatisDao;
import model.Usergroup;
import model.Userperson;



@Controller
@RequestMapping("/mypage/*")
public class MypageController {
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
	
	@RequestMapping("userPersonInfo")
	public String userPersonInfo(){
		String login = (String) session.getAttribute("id");
		Userperson per = userdao.selectOneP(login);
		m.addAttribute("per", per);
		return "/mypage/forPerson/userPersonInfo";
	}
	@RequestMapping("userPersonUpdateForm")
	public String userPersonUpdateForm() {
		String login = (String) session.getAttribute("id");
		Userperson per = userdao.selectOneP(login);
		m.addAttribute("per",per);
		return "/mypage/forPerson/userPersonUpdateForm";
	}
	
	@RequestMapping("userPersonUpdatePassCheck")
	public String userPersonUpdatePassCheck() {
		return "/mypage/forPerson/userPersonUpdatePassCheck";
	}

	
	@RequestMapping("userPersonUpdatePassCheckPro")
	public String userPersonUpdatePassCheckPro(String pass) {
		String login = (String) session.getAttribute("id");
		Userperson per = userdao.selectOneP(login);
		String msg="비밀번호가 일치합니다.";
		String url="/mypage/userPersonInfo";
		if(pass.equals(per.getPass())) {
			url = "/mypage/userPersonUpdateForm";
		}else {
			msg = "비밀번호가 틀렸습니다.";
			url = "/mypage/userPersonUpdatePassCheck";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";
	}
	
	@RequestMapping("userPersonUpdatePro")
	public String userPersonUpdatePro(Userperson person)throws Exception {
		String login = (String) session.getAttribute("id");
		person.setId(login);
		String msg="회원 자료가 없습니다.";
		String url="/member/loginForm";
		Userperson olduser = userdao.selectOneP(login);
		if(olduser != null ) {
			int num = userdao.updateUserPerson(person);
			if(num > 0) {
				msg = person.getName()+"님의 정보가 수정되었습니다.";
				url = "/mypage/userPersonInfo";
			}else {
				msg = "정보 수정에 실패했습니다.";
				url = "/mypage/userPersonUpdateForm";
			}
			
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";
	}
	
	@RequestMapping("userPassChgPassCheckPro")
	public String userPassChgPassCheckPro(String pass) {
		String login = (String) session.getAttribute("id");
		Userperson per = userdao.selectOneP(login);
		String msg="비밀번호가 일치합니다.";
		String url="/mypage/userPersonInfo";
		if(pass.equals(per.getPass())) {
			url = "/mypage/userPassChg";
		}else {
			msg = "비밀번호가 틀렸습니다.";
			url = "/mypage/userPassChgPassCheck";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";
	}


	@RequestMapping("userPassChgPassCheck")
	public String userPassChgPassCheck(){
		return "/mypage/userPassChgPassCheck";
	}
	
	@RequestMapping("userPassChg")
	public String userPassChg(){
		return "/mypage/userPassChg";
	}
	
	@RequestMapping("userPassChgPro")
	public String userPassChgPro(String passchg1, String passchg2)throws Exception{
		String login = (String) session.getAttribute("id");
		String login1 = (String) session.getAttribute("kinds");
		
		String msg=" ";
		String url=" ";
		
		if (login1.equals("1")) {
			Userperson per = userdao.selectOneP(login);
			if (passchg1.equals(passchg2)) {
				int num = userdao.changePassP(per,passchg1);
				if(num>0) {
					msg =per.getName() + "님의 비밀번호가 변경되었습니다.";
					url = "/mypage/userPersonInfo";
				}
			}else {
				msg="두 비밀번호가 다릅니다.";
				url="/mypage/userPassChg";
			}
			
		}else {
			Usergroup gro = userdao.selectOneG(login);
			if (passchg1.equals(passchg2)) {
				int num = userdao.changePassG(gro,passchg1);
				if(num>0) {
					msg =gro.getName() + "님의 비밀번호가 변경되었습니다.";
					url = "/mypage/userPersonInfo";
				}
			}else {
				msg="두 비밀번호가 다릅니다.";
				url="/mypage/userPassChg";
			}
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";
	}
	

}
