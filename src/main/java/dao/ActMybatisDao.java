package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.act;

@Repository
public class ActMybatisDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	private static final String as = "act.";
	private Map map = new HashMap();
	
	public int insertact(act active) {
		int num = session.insert(as + "insertact", active);
		return num;
		
	}
	public int raiseUpdate(int raised, int index_num) {
		map.clear();
		map.put("index_num", index_num);
		map.put("raised", raised);
		int num = session.update(as + "raiseUpdate", map);
		return num;
	}
	
}
