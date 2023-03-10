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
		
		String p_type="2";
		int nowpage = 1;
		int end = nowpage *4;
		List<Board> listdona = bd.boardmain(p_type,nowpage,end);
		
		m.addAttribute("listdona",listdona);
		
		
		return "/mainPage";
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
			msg = group.getP_name() + "?????? ????????? ?????????????????????.";
			url = "/giveTogether/loginForm";
		}else {
			msg = "??????????????? ?????? ????????????.";
			url = "/giveTogether/joinForGroup";			
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";
	}
	
	@RequestMapping("pictureimgForm")
	public String pictureimgForm() {
		/* 1) upload folder ????????? /webapp/user/picture
		 * 2) @RequestMapping("picturePro") ???????????? ????????? ?????? ??????.
		 */
		return "/user/pictureimgForm";
}
	
	@RequestMapping("picturePro")
	public String picturePro(@RequestParam("picture") MultipartFile multipartFile) {
		String path = request.getServletContext().getRealPath("/")+"view/user/picture/";
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
			}				
		}
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
			msg = person.getName() + "?????? ????????? ?????????????????????.";
			url = "/giveTogether/loginForm";
		}else {
			msg = "??????????????? ?????? ????????????.";
			url = "/giveTogether/joinForPerson";			
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";
	}
	
	
	@RequestMapping("loginPro")
	public String loginPro(String id, String pass, String kinds) {
		String msg="????????? ?????? ?????? ????????? ???????????????";
		String url="/giveTogether/loginForm";
		
		if(kinds.equals("1")) {
			Userperson per = userdao.selectOneP(id);
			if(per != null) {
				if(pass.equals(per.getPass())) {
					//???????????? ????????? ??????
					request.getSession().setAttribute("id", id);
					request.getSession().setAttribute("kinds", kinds);
					msg = "????????????" + per.getName() + "?????? ????????? ???????????????.";
					url = "/giveTogether/main";	
				}else {
					msg = "??????????????? ????????? ?????????.";
				}
							
			}
		}
		if(kinds.equals("2")) {
			Usergroup gro = userdao.selectOneG(id);
			if(gro != null) {
				if(pass.equals(gro.getPass())) {
					request.getSession().setAttribute("id", id);
					request.getSession().setAttribute("kinds", kinds);
					msg = "????????????" + gro.getName() + "?????? ????????? ???????????????.";
					url = "/giveTogether/main";	
				}else {
					msg = "??????????????? ????????? ?????????.";
				}
			}
		}
		
		//id??? ???????????? ?????? : msg : id??? ??????????????????
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";
	}
	
	@RequestMapping("logout")
	public String logout() {
		String login = (String) session.getAttribute("id");
		session.invalidate();
		String msg = login + "?????? ???????????? ???????????????.";
		String url = "/giveTogether/main";
		
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
		
		
		String msg = "????????? ?????? ??????";
		String url = "/giveTogether/main";
		
		String boardid = (String) session.getAttribute("boardid");  //1:????????????, 2:???????????????, 3:QnA
		if(boardid == null) boardid = "1";
		
		board.setBoardid(boardid);//?????? ????????????
		System.out.println(board);
		int num = bd.insertBoard(board);
		if(num > 0) {
			msg = "????????? ?????? ??????";
			url = "/giveTogether/main";
		}
		
		System.out.println(board);
		
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		
		return "/alert";
	}
	
	

}
