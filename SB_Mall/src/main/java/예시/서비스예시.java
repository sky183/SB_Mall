/* 
 
package 예시;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.admin.dao.AdminDao;
import com.sb.mall.admin.model.AdminVO;

@Repository
public class 서비스예시 {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private Dao dao;
	
	@Transactional
	public String getAdminReport() {
		
		dao = sqlSessionTemplate.getMapper(AdminDao.class);
		
		return "";

	}

}
*/