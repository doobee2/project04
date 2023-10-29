package kr.ed.haebeop.service;


import kr.ed.haebeop.domain.Free;
import kr.ed.haebeop.persistence.FreeMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FreeServiceImpl implements FreeService {

    @Autowired
    private FreeMapper freeMapper;


    @Override
    public List<Free> freeList(Page page) throws Exception {
        return freeMapper.freeList(page);
    }

    @Override
    public List<Free> freeListForMain() throws Exception {
        return freeMapper.freeListForMain();
    }

    @Override
    public int totalCount(Page page) throws Exception {
        return freeMapper.totalCount(page);
    }

    @Override
    public Free freeDetail(int fno) throws Exception {
        return freeMapper.freeDetail(fno);
    }

    @Override
    public void freeInsert(Free dto) throws Exception {
        freeMapper.freeInsert(dto);
    }

    @Override
    public void freeDelete(int fno) throws Exception {
        freeMapper.freeDelete(fno);
    }

    @Override
    public void freeEdit(Free dto) throws Exception {
        freeMapper.freeEdit(dto);
    }
}