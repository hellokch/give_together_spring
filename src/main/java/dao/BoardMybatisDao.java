package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Board;
import mybatis.MybatisConnection;

@Repository
public class BoardMybatisDao {

	@Autowired
	private static final String ns = "board.";
	private Map map = new HashMap();

	public int insertBoard(Board board) {
		SqlSession session = MybatisConnection.getConnection();
		int num = session.insert(ns+"insertBoard", board);
		MybatisConnection.close(session);
		
		return num;
	}
	
	public int boardCount(String boardid) {
		SqlSession session = MybatisConnection.getConnection();
		int boardCount = session.selectOne(ns+"boardCount", boardid);
		MybatisConnection.close(session);
		
		return boardCount;
		
	}
	
	public List<Board> boardList(String boardid, int pageInt, int limit) {
		/*
		 * 1 page : 1~3
		 * 2 page : 4~6
		 * 3 page : 7~9
		 * 
		 * n page : ((page - 1) *limit) + 1 ~ page * limit
		 * 
		 * 
		 */
		map.clear();
		map.put("boardid", boardid);
		map.put("start", ((pageInt - 1) * limit) + 1);
		map.put("end", (pageInt*limit));
		
		SqlSession session = MybatisConnection.getConnection();
		List<Board> list = session.selectList(ns+"boardList", map);
		MybatisConnection.close(session);
		
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
