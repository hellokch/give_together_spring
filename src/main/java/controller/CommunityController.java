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
import dao.UserMybatisDao;
import model.Board;
import model.Usergroup;
import model.Userperson;

@Controller
@RequestMapping("/community/")
public class CommunityController {
	
	@Autowired
	BoardMybatisDao bd;
	
	@Autowired
	UserMybatisDao userdao;
	

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
	public String communitymin(@RequestParam(value="last", required = false, defaultValue = "3")int last){
		String id = (String) session.getAttribute("id");
		String kinds = (String) session.getAttribute("kinds");
		String p_type=(String) session.getAttribute("p_type");
		String c_type="3";
		int nowpage = 1;
		
		System.out.println(last);
		if (last!=0) nowpage=last; 
		
		int end = nowpage *3;
		
		int boardCount = bd.boardCount(c_type);
		List<Board> list = bd.boardmain(c_type,nowpage,end);
		
		if (end>boardCount)  end=boardCount;

		m.addAttribute("list",list);
		m.addAttribute("end",end);
		m.addAttribute("boardCount",boardCount);
	
		
		
		return "/communityPage";
	}
	
	
	
	@RequestMapping("boardForm")
	public String boardForm() {			
		String login = (String) session.getAttribute("id");
		Userperson per = userdao.selectOneP(login);
		m.addAttribute("per",per);
		return "/community/boardForm"; 						
	}
				
	
	
	
	
	@PostMapping("communityPro")
	public String communityPro(@RequestParam("uploadfile") MultipartFile multipartFile, Board board) {
				
		String login = (String) session.getAttribute("id");
		String path = request.getServletContext().getRealPath("/") + "view/community/img/";
		String filename = null;
		
		if(!multipartFile.isEmpty()) {
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
		
		
		String msg = "게시글 등록 실패";
		String url = "/giveTogether/main";
		
		System.out.println(board);
		board.setP_type("3");	
		
		
					
		System.out.println(board);
		
		int num = bd.insertBoard(board);
		if(num > 0) {
			msg = "게시물 등록 성공";
			url = "/community/community";
		}
		
		System.out.println(board);
		
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		
		return "/alert";
	}		
	@RequestMapping("boardInfo")
	public String boardInfo(int num){
		Board board = bd.boardOne(num);
		String writer = board.getId();
		Usergroup boardwriter = userdao.selectOneG(writer);
		m.addAttribute("boardwriter",boardwriter);
		m.addAttribute("board",board);
		return "/community/boardInfo";
	}
	@RequestMapping("boardDeleteForm")
	public String boardDeleteForm(int num) {
		
		request.setAttribute("num", num);
		
		return "/community/boardDeleteForm";
	}
	
	
	
	@RequestMapping("boardUpdateForm")
	public String boardUpdateForm(int num) {							
		Board board = bd.boardOne(num);
		m.addAttribute("board", board);
		return "/community/boardUpdateForm";
		}
	
	@RequestMapping("boardUpdatePro")
	public String boardUpdatePro(@RequestParam("file") MultipartFile multipartfile, Board board) {
		
		Board dbboard = bd.boardOne(board.getIndex_num());
		
		String path = request.getServletContext().getRealPath("/") + "view/board/img/";
		if(!multipartfile.isEmpty()) {
			File file = new File(path, multipartfile.getOriginalFilename());
			String filename = multipartfile.getOriginalFilename();
			board.setPicture(filename);
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
		else {
			board.setPicture(dbboard.getPicture());
		}
				
		
		String url = "/community/boardInfo?num=" + board.getIndex_num();
		String msg = "";
		if(bd.boardUpdate(board)>0) {
			msg = "수정 완료";
			url = "/community/boardInfo?num=" + board.getIndex_num();
		}else {
			msg = "수정 실패";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		
		return "/alert";
	}
	
	
	
	
	
	
}	




