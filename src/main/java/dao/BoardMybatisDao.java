package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Board;
import mybatis.MybatisConnection;

@Repository
public class BoardMybatisDao {

	@Autowired
	SqlSessionTemplate session;
	
	private static final String ns = "board.";
	private Map map = new HashMap();

	public int insertBoard(Board board) {
		
		int num = session.insert(ns+"insertBoard", board);
		
		return num;
	}
	
	public int boardCount(String p_type) {
		int boardCount = session.selectOne(ns+"boardCount", p_type);
		
		return boardCount;
	}
	
	public List<Board> boardList(String p_type, int pageInt, int limit) {
		
		map.clear();
		map.put("p_type", p_type);
		map.put("start", ((pageInt - 1) * limit) + 1);
		map.put("end", (pageInt*limit));
		
		List<Board> list = session.selectList(ns+"boardList", map);
		
		return list;
		
	}
	
	public Board boardOne(int index_num) {
		Board board = session.selectOne(ns+"boardOne", index_num);
		return board;
	}
	
	public void refStepAdd(int ref, int refstep) {
		SqlSession session = MybatisConnection.getConnection();
		map.clear();
		map.put("ref", ref);
		map.put("refstep", refstep);
		
		session.update(ns+"refStepAdd", map);
		MybatisConnection.close(session);
		
	}
	
	public int insertReply(Board board) {
		SqlSession session = MybatisConnection.getConnection();
		int num = session.insert(ns+"insertReply", board);
		MybatisConnection.close(session);
		return num;
	}
	
	public int boardDelete(int num) {
		int result = session.delete(ns+"deleteBoard", num);
		return result;
	}
	
	public List<Board> boardmain(String p_type, int nowpage, int end) {
		
		map.clear();
		map.put("p_type", p_type);
		map.put("nowpage", 1);
		map.put("end", end);
		System.out.println(map);
		List<Board> list = session.selectList(ns+ "boardmain", map);
		return list;
		
	}
	
	public int boardUpdate(Board board) {
		int num = session.update(ns+"volunteerUpdate", board);
		return num;
	}
	
	
}
