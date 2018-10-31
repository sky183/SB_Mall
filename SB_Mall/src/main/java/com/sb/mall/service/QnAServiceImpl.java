package com.sb.mall.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sb.mall.dao.QnADao;
import com.sb.mall.model.QnABoard;

@Service
public class QnAServiceImpl implements QnAService {
	
	@Inject
    private QnADao dao;
    
    
    @Override
    public void create(QnABoard qna) throws Exception {
        dao.create(qna);
 
    }
 
    @Override
    public List<QnABoard> listAll() throws Exception {
        
        
        return dao.listAll();
    }
 
    @Override
    public QnABoard read(Integer qnaSeq) throws Exception {
        
        return dao.read(qnaSeq);
    }
 
    @Override
    public void delete(Integer qnaSeq) throws Exception {
        dao.delete(qnaSeq);
 
    }
 
    @Override
    public void update(QnABoard qna) throws Exception {
        
        dao.update(qna);
 
    }
	
	
	
	
	
	/*@Resource(name="QnADao")
	private QnADao qnaDao;
	
	@Override
	public List<Map<String, Object>> selectQnAList(Map<String, Object> map) throws Exception {
		return qnaDao.selectQnAList(map);
		
	}

	@Override
	public void insertQnA(Map<String, Object> map) throws Exception {
		qnaDao.insertQnA(map);
	}

	@Override
	public Map<String, Object> selectQnADetail(Map<String, Object> map) throws Exception {
		qnaDao.updateHitCnt(map);
		Map<String, Object> resultMap = qnaDao.selectQnADetail(map);
		return resultMap;
	}

	@Override
	public void updateQnA(Map<String, Object> map) throws Exception{
		qnaDao.updateQnA(map);
	}

	@Override
	public void deleteQnA(Map<String, Object> map) throws Exception {
		qnaDao.deleteQnA(map);
	}*/

}











/*import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sb.mall.dao.QnADao;
import com.sb.mall.model.MemberInfo;
import com.sb.mall.model.QnABoard;

@Service
public class QnAWriteService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private QnADao qnaDao;
	
	public boolean writeQnAService(QnABoard qnaWrite) {
		qnaDao = sqlSessionTemplate.getMapper(QnADao.class);
		boolean result = false;
		int writeDone;
		
		writeDone = qnaDao.insertQnABoard(qnaWrite);
		System.out.println("writeDone : " + writeDone);
		
		if(writeDone == 1) {
			result = true;
		}
		
		return result;
		
	}
	
	@Transactional
	public void qnaWrite(MemberInfo memberInfo, QnABoard qnaBoard) throws SQLException {
		qnaDao=sqlSessionTemplate.getMapper(QnADao.class);
		qnaDao.insertQnABoard(memberInfo);
		qnaBoard.setUserSeq(memberInfo.getUserSeq());
		qnaDao.insertQnABoard(qnaBoard);
		
		System.out.println(memberInfo);
		System.out.println(qnaBoard);
	}
	
}
*/