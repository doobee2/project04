package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Test;
import kr.ed.haebeop.persistence.TestMapper1;
import kr.ed.haebeop.persistence.TestMapper2;
import kr.ed.haebeop.repository.TestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestServiceImpl implements TestService{

    @Autowired
    private TestRepository testRepository;

    @Autowired
    private TestMapper1 testMapper1;

    @Autowired
    private TestMapper2 testMapper2;

    @Override
    public List<Test> getTestList1() {
        return testRepository.getTestList1();
    }

    @Override
    public Test getTest1(int num) {
        return testRepository.getTest1(num);
    }

    @Override
    public void insert1(Test test) {
        testRepository.insert1(test);
    }

    @Override
    public void update1(Test test) {
        testRepository.update1(test);
    }

    @Override
    public void delete1(int num) {
        testRepository.delete1(num);
    }

    @Override
    public List<Test> getTestList2() {
        return testMapper1.getTestList2();
    }

    @Override
    public Test getTest2(int num) {
        return testMapper1.getTest2(num);
    }

    @Override
    public void insert2(Test test) {
        testMapper1.insert2(test);
    }

    @Override
    public void update2(Test test) {
        testMapper1.update2(test);
    }

    @Override
    public void delete2(int num) {
        testMapper1.delete2(num);
    }

    @Override
    public List<Test> getTestList3() {
        return testMapper2.getTestList3();
    }

    @Override
    public Test getTest3(int num) {
        return testMapper2.getTest3(num);
    }

    @Override
    public void insert3(Test test) {
        testMapper2.insert3(test);
    }

    @Override
    public void update3(Test test) {
        testMapper2.update3(test);
    }

    @Override
    public void delete3(int num) {
        testMapper2.delete3(num);
    }
}