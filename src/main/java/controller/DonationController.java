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
		String msg = "게시물 등록 실패";
		String url = "/donation/donationForm";		
		
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
		
		int num = bd.insertBoard(board);
		if (num>0) {
			msg = "게시물 등록 성공";  
			url="/donation/donation";
		}		
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";
	}
	

	
	
	
	
	@RequestMapping("donation")
	public String donationmain(@RequestParam(value="last", required = false, defaultValue = "1") int last)  {

		String p_type="2";
		
		int nowpage = 1;
		if (last!=0) nowpage=last; 
		int end = nowpage +2;
		int boardCount = bd.boardCount(p_type);
		
		List<Board> list = bd.boardmain(p_type,nowpage,end);
		
		if (end>boardCount)  end=boardCount;

		m.addAttribute("list",list);
		m.addAttribute("nowpage",nowpage);
		m.addAttribute("end",end);
		m.addAttribute("boardCount",boardCount);
	
		return "/donationPage";
	}
	
	@RequestMapping("donationForm")
	public String donationForm () {
		String login = (String) session.getAttribute("id");
		Usergroup gro = userdao.selectOneG(login);
		m.addAttribute("gro",gro);
		return "/donation/donationForm";
	}
	
	@RequestMapping("donationInfo")
	public String donationInfo(int num){
		
		Board board = bd.boardOne(num);
		String writer = board.getId();
		
		Usergroup boardwriter = userdao.selectOneG(writer);
		
		m.addAttribute("boardwriter",boardwriter);
		m.addAttribute("board",board);
		
		return "/donation/donationInfo";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("boardDeleteForm")
	public String boardDeleteForm (int num) {
		
		
		m.addAttribute("num", num);
		return "/donation/donationDeleteForm";
	}
	
	@RequestMapping("boardDeletePro")
	public String boardDeletePro (int num, String pass) {
		
		Board board=bd.boardOne(num);
		String msg = "비밀번호가 틀렸습니다";
		String url = "/donation/boardDeleteForm?num="+num;
		if(bd.boardDelete(num) > 0) {
			msg = "삭제되었습니다.";
			url = "/donation/donationList";
		}
		else {

			msg = "board delete error";
			url = "/donation/donationList";
		}
		
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";
	}
	
	
	@RequestMapping("boardUpdateForm")
	public String boardUpdateForm (int num) {
		Board board=bd.boardOne(num);
		m.addAttribute("board", board);
		return "/donation/donationUpdateForm";
	}
	
	@PostMapping("boardUpdatePro")
	public String boardUpdatePro (@RequestParam("f") MultipartFile multipartFile, Board board) {
		Board dbboard = bd.boardOne(board.getIndex_num());		
		String path = request.getServletContext().getRealPath("/") + "view/donation/img/";

		if (!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename());
			String filename = multipartFile.getOriginalFilename();
			board.setPicture(filename);
			
			try {
				multipartFile.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			board.setPicture(dbboard.getPicture());
		}
	
	String msg = "비밀번호가 틀렸습니다";
	String url = "/donation/donationUpdateForm?num="+board.getIndex_num();	
		
		if (bd.boardUpdate(board)>0) {
			msg = "수정 완료";
			url = "/donation/donationInfo?num="+board.getIndex_num();
		} else {
			msg = "수정 실패";
		}
	
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		
		return "/alert";
	}
}