package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ActMybatisDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	private static final String as = "act.";
	private Map map = new HashMap();
	
	
}
