package com.sb.mall.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sb.mall.dao.QnADao;
import com.sb.mall.model.QnABoard;

@Repository
public class QnADaoImpl implements QnADao {
	
	@Inject
	private SqlSession sqlSession;

	private static String namespace = "org.hello.mapper.BoardMapper";
	 
    //게시판추가
    @Override
    public void create(QnABoard qna) throws Exception {
        
        sqlSession.insert(namespace + ".insertQnA", qna);
 
    }
    
    //게시판보기
    @Override
    public List<QnABoard> listAll() throws Exception {
        
        sqlSession.selectList(namespace + ".listQnA");
        return null;
    }
    
    //게시판 상세
    @Override
    public QnABoard read(Integer qnaSeq) throws Exception {
        sqlSession.selectOne(namespace + ".detailQnA", qnaSeq);
        return null;
    }
 
    //게시판 삭제
    @Override
    public void delete(Integer qnaSeq) throws Exception {
        sqlSession.delete(namespace + ".deleteQnA", qnaSeq);
 
    }
 
    //게시판 수정
    @Override
    public void update(QnABoard qna) throws Exception {
        sqlSession.update(namespace + ".updateQnA", qna);
 
    }
	
}
