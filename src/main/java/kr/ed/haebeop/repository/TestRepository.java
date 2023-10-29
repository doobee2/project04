package kr.ed.haebeop.repository;

import kr.ed.haebeop.domain.Test;

import java.util.List;

public interface TestRepository {

    public List<Test> getTestList1();
    public Test getTest1(int num);
    public void insert1(Test test);
    public void update1(Test test);
    public void delete1(int num);

}