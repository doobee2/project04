package kr.ed.haebeop.persistence;


import kr.ed.haebeop.domain.Free;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class FreeMapperImpl implements FreeMapper{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Free> freeList(Page page) throws Exception {
        return sqlSession.selectList("free.freeList", page);
    }

    @Override
    public List<Free> freeListForMain() throws Exception {
        return sqlSession.selectList("free.freeListForMain");
    }

    @Override
    public int totalCount(Page page) throws Exception {
        return sqlSession.selectOne("free.totalCount", page);
    }

    @Transactional
    @Override
    public Free freeDetail(int fno) throws Exception {
        sqlSession.update("free.visitCount", fno);
        return sqlSession.selectOne("free.freeDetail", fno);
    }

    @Override
    public void freeInsert(Free free) throws Exception {
        sqlSession.insert("free.freeInsert", free);
    }


    @Override
    public void freeEdit(Free free) throws Exception {
        sqlSession.update("free.freeEdit", free);
    }

    @Override
    public void freeDelete(int fno) throws Exception {
        sqlSession.delete("free.freeDelete", fno);
    }
}
