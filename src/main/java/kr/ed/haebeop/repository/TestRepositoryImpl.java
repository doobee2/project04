package kr.ed.haebeop.repository;

import kr.ed.haebeop.domain.Test;
import kr.ed.haebeop.persistence.TestMapper1;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TestRepositoryImpl implements TestRepository {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Test> getTestList1() {
        return sqlSession.selectList("test.getTestList");
    }

    @Override
    public Test getTest1(int num) {
        return sqlSession.selectOne("test.getTest");
    }

    @Override
    public void insert1(Test test) {
        sqlSession.insert("test.insert", test);
    }

    @Override
    public void update1(Test test) {
        sqlSession.update("test.update", test);
    }

    @Override
    public void delete1(int num) {
        sqlSession.delete("test.delete", num);
    }
}