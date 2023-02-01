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
	
	public Board boardOne(int num) {
		SqlSession session = MybatisConnection.getConnection();
		Board board = session.selectOne(ns+"boardOne", num);
		MybatisConnection.close(session);
		
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
	
	public int boardDelete(int num, String pass) {
		SqlSession session = MybatisConnection.getConnection();
		map.clear();
		map.put("num", num);
		map.put("pass", pass);
		int result = session.delete(ns+"deleteBoard", map);
		MybatisConnection.close(session);
		return result;
	}
}
