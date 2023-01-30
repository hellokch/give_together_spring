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
import model.Board;

@Controller
@RequestMapping("/community/")
public class CommunityController {	
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
	
	@RequestMapping("index")
	public String index() {
		System.out.println("request ok");
		
		m.addAttribute("name", "/community/*");
		return "/index"; 
	}
	
	@RequestMapping("boardForm")
	public String boardForm() {			
		return "/community/boardForm"; 
	}
	
	@PostMapping("boardPro")
	public String boardPro(@RequestParam("file2") MultipartFile multipartFile, Board board) {
			//저장 path확인
		String path =  request.getServletContext().getRealPath("/")+"view/community/img";						
        String filename= "";
		
		
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
        //체크 		
		board.file1(filename);	
		
		String msg = "게시물 등록 실패";
		String url = "/community/boardForm";
				
		
		String boardid = (String) session.getAttribute("boardid"); //1.공지사항 , 2:자유게시판 , 3:qna
		if(boardid == null) 
			boardid = "1";		
		board.setBoardid(boardid);
		System.out.println(board);						
			int num = bd.insertBoard(board);
			if (num > 0) {
				msg="게시물 등록 성공"; 
				url="/community/boardList"; 	
				}
		
		
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		
		
		return "/alert";
	}

	@RequestMapping("boardList")
	public String boardList() {
		//100개 order by 최근 num desc
		int limit = 10; //한 page당 게시물 갯수
		
		
		// boardid 파라메터로 넘어왔을때만 session에 저장한다
		
		if (request.getParameter("boardid") != null) {
			session.setAttribute("pageNum", "1"); //boardid 수정시에 pageNum을 1로 하여야 함.
			session.setAttribute("boardid", request.getParameter("boardid")); }
		
		String boardid = (String) session.getAttribute("boardid");
		if (boardid == null)       boardid = "1";
							
		
		// pageNum이 파라메터로 넘어왔을때만 session에 저장한다
		
		if (request.getParameter("pageNum") != null) {
			session.setAttribute("pageNum", request.getParameter("pageNum")); }
		String pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null)       pageNum = "1";
		
		int pageInt = Integer.parseInt(pageNum);  //현재 page
		
		
		
		String boardName = "";
		switch(boardid) {
		case "1" :
			boardName = "같이 봉사해요"; 
			break;
		case "2" : 
			boardName = "우리 소통해요";
			break;
		case "3" : 
			boardName = "좋은정보 나눠요"; 
			break;
		
		}
		int boardCount = bd.boardCount(boardid);
		List<Board> list=bd.boardList(boardid, pageInt, limit);
		
		
        int bottomLine = 3; // 하단 page 표시 수		
		
		int startPage = (pageInt-1)/bottomLine*bottomLine+1;
		int endPage = startPage + bottomLine - 1;

		int maxPage = (boardCount/limit) +(boardCount%limit==0?0:1); // 총 page수
		
		if (maxPage < endPage) endPage=maxPage;
		
		
					
		
		m.addAttribute("boardCount", boardCount);
		m.addAttribute("boardName", boardName);
		m.addAttribute("list", list);
		m.addAttribute("boardid", boardid);
		m.addAttribute("pageInt", pageInt);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("maxPage", maxPage);
		
		
		
		
		return "/community/boardList"; 
	}


	@RequestMapping("boardInfo")
	public String boardInfo(int num) {
		
		Board board=bd.boardOne(num);
		m.addAttribute("board", board);
		return "/community/boardInfo";	
	}
	
					
		
	
		@RequestMapping("boardDeletePro")
		public String boardDeletePro(int num, String pass) {		
			
			Board board = bd.boardOne(num);
			String msg = "비밀번호가 틀렸습니다";
			String url = "/community/boardDeleteForm?num="+num;
			if (board.getPass().equals(pass)) {
				if (bd.boardDelete(num, pass)>0) {
				msg = "삭제 되었습니다";
				url = "/community/boardList";
						}
				}
			
			m.addAttribute("msg", msg);
			m.addAttribute("url", url);
			return "/alert";
				
		}	
		
		@RequestMapping("boardUpdateForm")
		public String boardUpdateForm(int num) {							
			Board board = bd.boardOne(num);
			m.addAttribute("board", board);
			return "/community/boardUpdateForm";
			}

		@PostMapping("boardUpdatePro")
		public String boardUpdatePro(@RequestParam("f") MultipartFile multipartFile, Board board) {							
			
			Board dbboard = bd.boardOne(board.getNum());
						
			String path =  request.getServletContext().getRealPath("/")+"view/community/img";		
			
			
			
	 					
			if (!multipartFile.isEmpty()) {
				File file = new File(path, multipartFile.getOriginalFilename());			
				String	filename = multipartFile.getOriginalFilename();	
				board.setFile1(filename);
			try {
			   multipartFile.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			  }		}else {	
					
			board.setFile1(dbboard.getFile1());	
		}	
			
			String msg = "비밀번호가 틀렸습니다";
			String url = "/community/boardUpdateForm?num="+board.getNum();
			//비밀번호 확인
			if (board.getPass().equals(dbboard.getPass())) {
				//수정하기
				if(bd.boardUpdate(board)>0) {
					msg = "수정 완료";
					url = "/community/boardInfo?num="+board.getNum();
				} else {
					msg = "수정 실패";				}
			}
			m.addAttribute("msg", msg);
			m.addAttribute("url", url);
			
			
			return "/alert";
			}

		
		
}	




}