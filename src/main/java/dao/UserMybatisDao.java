package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;

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
	
	public int updateUserPerson(Userperson person) {
		int num = session.update(ns + "updateUserPerson",person);
		return num;
	}
	
	public int changePassP(String id,String pass, String kinds) {
		Map map = new HashMap();
		map.put("id", id);
		map.put("pass", pass);
		map.put("kinds", kinds);
		int num = session.update(ns+"changePassP", map);
		return num;
	}
	public int changePassG(String id,String pass, String kinds) {
		Map map = new HashMap();
		map.put("id", id);
		map.put("pass", pass);
		map.put("kinds", kinds);
		int num = session.update(ns+"changePassG", map);
		return num;
	}
	
	public int deleteP(String id) {
		int num = session.update(ns + "deleteP", id);
		return num;
	}
	public int deleteG(String id) {
		int num = session.update(ns + "deleteP", id);
		return num;
	}
	
	public int updateUserGroup(Usergroup group) {
		int num = session.update(ns + "updateUserGroup",group);
		return num;
	}
	
	
}
