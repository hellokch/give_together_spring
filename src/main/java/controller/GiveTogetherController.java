package controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardMybatisDao;
import dao.UserMybatisDao;
import model.Board;
import model.Usergroup;
import model.Userperson;





@Controller
@RequestMapping("/giveTogether/")
public class GiveTogetherController {
	@Autowired
	UserMybatisDao userdao;
	
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
	public String joinUserGroupPro(Usergroup group)throws Exception {
		
		System.out.println("joinUserGroupPro");	
		
		
		int count = userdao.insertUsergroup(group);
		String msg="";
		String url="";
		
		if(count>0) {
			msg = group.getP_name() + "님의 가입이 완료되었습니다.";
			url = "/giveTogether/loginForm";
		}else {
			msg = "회원가입에 실패 했습니다.";
			url = "/giveTogether/joinForGroup";			
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/alert";
	}
	
	@RequestMapping("pictureimgForm")
	public String pictureimgForm() {
		/* 1) upload folder 만든다 /webapp/user/picture
		 * 2) @RequestMapping("picturePro") 이미지를 폴더에 저장 한다.
		 */
		return "/user/pictureimgForm";
}
	
	@RequestMapping("picturePro")
	//<input class="w3-input" type="file" name="picture">
	public String picturePro(@RequestParam("picture") MultipartFile multipartFile) {
		String path = 
					request.getServletContext().getRealPath("/")+"view/user/picture";
		System.out.println(path);
		String filename=null;
		
		
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
		}				}
		System.out.println(filename);
		m.addAttribute("filename", filename);	
		return "/user/picturePro";
}
	
	
	
	@RequestMapping("joinForPerson")
	public String joinForPerson(){
		return "/user/joinForPerson";
	}
	
	@RequestMapping("joinUserPersonPro")
	public String joinUserPersonPro(Userperson person)throws Exception {
		System.out.println("joinUserPersonPro");
		
		
		
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
		String login = (String) session.getAttribute("id");
		Userperson per = userdao.selectOneP(login);
		m.addAttribute("per", per);
		return "/mypage/userPersonInfo";
	}
	
	@RequestMapping("loginPro")
	public String loginPro(String id, String pass, String kinds) {
		String msg="아이디 혹은 회원 분류를 확인하세요";
		String url="/giveTogether/loginForm";
		//per에 id가 있는지 확인
		if(kinds.equals("1")) {
			Userperson per = userdao.selectOneP(id);
			if(pass.equals(per.getPass())) {
				//개인회원 로그인 성공
				request.getSession().setAttribute("id", id);
				request.getSession().setAttribute("kinds", kinds);
				msg = "개인회원" + per.getName() + "님이 로그인 하셨습니다.";
				url = "/giveTogether/main";	
			}else {
				msg = "비밀번호를 확인해 주세요.";
			}
						
		}
		if(kinds.equals("2")) {
			Usergroup gro = userdao.selectOneG(id);
			if(pass.equals(gro.getPass())) {
				request.getSession().setAttribute("id", id);
				request.getSession().setAttribute("kinds", kinds);
				msg = "단체회원" + gro.getName() + "님이 로그인 하셨습니다.";
				url = "/giveTogether/main";	
			}else {
				msg = "비밀번호를 확인해 주세요.";
			}
		}
		
		//id가 어디에도 없음 : msg : id를 확인해주세요
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";
	}
	
	@RequestMapping("logout")
	public String logout() {
		String login = (String) session.getAttribute("id");
		session.invalidate();
		String msg = login + "님이 로그아웃 되었습니다.";
		String url = "/giveTogether/main";
		
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";
	}
	
	@RequestMapping("userPersonUpdateForm")
	public String userPersonUpdateForm() {
		String login = (String) session.getAttribute("id");
		Userperson per = userdao.selectOneP(login);
		m.addAttribute("per",per);
		return "/mypage/userPersonUpdateForm";
	}
	
	@RequestMapping("userPersonUpdatePassCheck")
	public String userPersonUpdatePassCheck() {
		return "/mypage/userPersonUpdatePassCheck";
	}
	
	@RequestMapping("userPersonUpdatePassCheckPro")
	public String userPersonUpdatePassCheckPro(String pass) {
		String login = (String) session.getAttribute("id");
		Userperson per = userdao.selectOneP(login);
		String msg="비밀번호가 일치합니다.";
		String url="/giveTogether/userPersonInfo";
		if(pass.equals(per.getPass())) {
			url = "/giveTogether/userPersonUpdateForm";
		}else {
			msg = "비밀번호가 틀렸습니다.";
			url = "/giveTogether/userPersonUpdatePassCheck";
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
				url = "/giveTogether/userPersonInfo";
			}else {
				msg = "정보 수정에 실패했습니다.";
				url = "/giveTogether/userPersonUpdateForm";
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
		String url="/giveTogether/userPersonInfo";
		if(pass.equals(per.getPass())) {
			url = "/giveTogether/userPassChg";
		}else {
			msg = "비밀번호가 틀렸습니다.";
			url = "/giveTogether/userPassChgPassCheck";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";
	}

	
	@RequestMapping("volunteerPro")
	public String volunteerPro(@RequestParam("uploadfile") MultipartFile multipartfile, Board board) {
		
		System.out.println("request ok");
		
		String path = request.getServletContext().getRealPath("/") + "view/volunteer/img/";
		String filename = null;
		
		if(!multipartfile.isEmpty()) {
			File file = new File(path, multipartfile.getOriginalFilename());
			filename = multipartfile.getOriginalFilename();
			try {
				multipartfile.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		board.setPicture(filename);
		
		
		String msg = "게시글 등록 실패";
		String url = "/giveTogether/main";
		
		String boardid = (String) session.getAttribute("boardid");  //1:공지사항, 2:자유게시판, 3:QnA
		if(boardid == null) boardid = "1";
		
		board.setBoardid(boardid);//우선 공지사항
		System.out.println(board);
		int num = bd.insertBoard(board);
		if(num > 0) {
			msg = "게시물 등록 성공";
			url = "/giveTogether/main";
		}
		
		System.out.println(board);
		
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
					url = "/giveTogether/userPersonInfo";
				}
			}else {
				msg="두 비밀번호가 다릅니다.";
				url="/giveTogether/userPassChg";
			}
			
		}else {
			Usergroup gro = userdao.selectOneG(login);
			if (passchg1.equals(passchg2)) {
				int num = userdao.changePassG(gro,passchg1);
				if(num>0) {
					msg =gro.getName() + "님의 비밀번호가 변경되었습니다.";
					url = "/giveTogether/userPersonInfo";
				}
			}else {
				msg="두 비밀번호가 다릅니다.";
				url="/giveTogether/userPassChg";
			}
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";
	}
	

}
