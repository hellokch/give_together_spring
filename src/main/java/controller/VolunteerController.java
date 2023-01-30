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
@RequestMapping("/volunteer/")
public class VolunteerController {
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
		
		System.out.println(board);
		board.setP_type("1");
		
		board.setAct_time(board.getStart_t() + ":00~" + board.getEnd_t() + ":00");
		board.setBoardid("1");
		
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
	

}
