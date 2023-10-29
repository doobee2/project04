package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Test;

import java.util.List;

public interface TestService {

    public List<Test> getTestList1();
    public Test getTest1(int num);
    public void insert1(Test test);
    public void update1(Test test);
    public void delete1(int num);
    public List<Test> getTestList2();
    public Test getTest2(int num);
    public void insert2(Test test);
    public void update2(Test test);
    public void delete2(int num);
    public List<Test> getTestList3();
    public Test getTest3(int num);
    public void insert3(Test test);
    public void update3(Test test);
    public void delete3(int num);

}