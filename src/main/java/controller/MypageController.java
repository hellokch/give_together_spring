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
@RequestMapping("/mypage/")
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
		String url="/user/loginForm";
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
				int num = userdao.changePassP(login, passchg1, login1);
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
				int num = userdao.changePassG(login, passchg1, login1);
				if(num>0) {
					msg =gro.getName() + "님의 비밀번호가 변경되었습니다.";
					url = "/mypage/userGroupInfo";
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
	
	@RequestMapping("userDelete")
	public String userDelete(){
		return "/mypage/userDelete";
	}
	
	@RequestMapping("userDeletePro")
	public String userDeletePro(String pass){
		String login = (String) session.getAttribute("id");
		String login1 = (String) session.getAttribute("kinds");
		String msg="비밀번호가 틀렸습니다.";
		String url="/mypage/userDelete";		
		if(login1.equals("1")) {
			Userperson per = userdao.selectOneP(login);
			if(pass.equals(per.getPass())) {
				int num = userdao.deleteP(login);
				if(num>0) {
					msg = per.getName() + "님이 탈퇴처리 되었습니다.";
					session.invalidate();
					url="/giveTogether/main";
				}else {
					msg="회원탈퇴가 실패 했습니다.";
					url="/mypage/userDelete";
				}				
			}			
		}else {
			Usergroup gro = userdao.selectOneG(login);
			if(pass.equals(gro.getPass())) {
				int num = userdao.deleteG(login);
				if(num>0) {
					msg = gro.getName() + "님이 탈퇴처리 되었습니다.";
					session.invalidate();
					url="/giveTogether/main";
				}else {
					msg="회원탈퇴가 실패 했습니다.";
					url="/mypage/userDelete";
				}				
			}			
			
		}
		/* if(login1.equals("2")) { } */
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";
	}

	@RequestMapping("userGroupInfo")
	public String userGroupInfo(){
		String login = (String) session.getAttribute("id");
		Usergroup gro = userdao.selectOneG(login);
		m.addAttribute("gro", gro);
		return "/mypage/forGroup/userGroupInfo";
	}
	
	@RequestMapping("userGroupUpdatePassCheck")
	public String userGroupUpdatePassCheck() {
		return "/mypage/forGroup/userGroupUpdatePassCheck";
	}

	
	@RequestMapping("userGroupUpdatePassCheckPro")
	public String userGroupUpdatePassCheckPro(String pass) {
		String login = (String) session.getAttribute("id");
		Usergroup gro = userdao.selectOneG(login);
		String msg="비밀번호가 일치합니다.";
		String url="/mypage/userGroupInfo";
		if(pass.equals(gro.getPass())) {
			url = "/mypage/userGroupUpdateForm";
		}else {
			msg = "비밀번호가 틀렸습니다.";
			url = "/mypage/userGroupUpdatePassCheck";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";
	}
	
	@RequestMapping("userGroupUpdateForm")
	public String userGroupUpdateForm() {
		String login = (String) session.getAttribute("id");
		Usergroup gro = userdao.selectOneG(login);
		m.addAttribute("gro",gro);
		return "/mypage/forGroup/userGroupUpdateForm";
	}
	
	@RequestMapping("userGroupUpdatePro")
	public String userGroupUpdatePro(Usergroup group) {
		String login = (String) session.getAttribute("id");
		group.setId(login);
		String msg="회원 자료가 없습니다.";
		String url="/user/loginForm";
		Usergroup olduser = userdao.selectOneG(login);
		if(olduser != null ) {
			int num = userdao.updateUserGroup(group);
			if(num > 0) {
				msg = group.getName()+"님의 정보가 수정되었습니다.";
				url = "/mypage/userGroupInfo";
			}else {
				msg = "정보 수정에 실패했습니다.";
				url = "/mypage/userGroupUpdateForm";
			}
			
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";
	}


}
