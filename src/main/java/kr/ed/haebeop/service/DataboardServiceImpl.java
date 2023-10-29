package kr.ed.haebeop.service;


import kr.ed.haebeop.domain.Databoard;
import kr.ed.haebeop.persistence.DataboardMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DataboardServiceImpl implements DataboardService {

    @Autowired
    private DataboardMapper databoardMapper;


    @Override
    public List<Databoard> databoardList(Page page) throws Exception {
        return databoardMapper.databoardList(page);
    }

    @Override
    public Databoard databoardDetail(int bno) throws Exception {
        return databoardMapper.databoardDetail(bno);
    }

    @Override
    public int databoardCount(Page page) throws Exception {
        return databoardMapper.databoardCount(page);
    }

    @Override
    public void databoardInsert(Databoard databoard) throws Exception {
        databoardMapper.databoardInsert(databoard);
    }

    @Override
    public void databoardEdit(Databoard databoard) throws Exception {
        databoardMapper.databoardEdit(databoard);
    }

    @Override
    public void databoardDelete(int bno) throws Exception {
        databoardMapper.databoardDelete(bno);
    }
}