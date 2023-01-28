package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Board;
import model.Usergroup;
import model.Userperson;

@Repository
public class UserMybatisDao {
	@Autowired
	SqlSessionTemplate session;
	
	private static final String ns = "user.";
	

	
	public int insertUserperson(Userperson person) {
		int num = session.insert(ns + "insertUserperson", person);
		return num;
				
	}
	
	public int insertUsergroup(Usergroup group) {
		
		int num = session.insert(ns + "insertUsergroup", group);
		
		return num;	
	}	
	public Userperson  selectOneP(String id) {
		Userperson person = session.selectOne(ns + "selectOneP", id);
		return person;				
	}

	public Usergroup  selectOneG(String id) {
		Usergroup group = session.selectOne(ns + "selectOneG", id);
		return group;				
	}
/*
  private Map map = new HashMap();
	private Map map1 = new HashMap();
	public List<Board> giveBoard() {
		System.out.println("To 11111");
		SqlSession session = MybatisConnection.getConnection();
		System.out.println("To 222222");
		map.clear();
		List<Board> list= session.selectList (ns + "giveBoardList", map);
		System.out.println("To 333333");
		MybatisConnection.close(session);
		System.out.println("To 444444");
		return list;
		
	}*/
}
