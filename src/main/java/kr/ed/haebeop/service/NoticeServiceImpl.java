package kr.ed.haebeop.service;


import kr.ed.haebeop.domain.Notice;
import kr.ed.haebeop.persistence.NoticeMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService{

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public List<Notice> noticeList(Page page) throws Exception {
        return noticeMapper.noticeList(page);
    }

    @Override
    public List<Notice> noticeListForMain() throws Exception {
        return null;
    }

    @Override
    public Notice noticeDetail(int no) throws Exception {
        return noticeMapper.noticeDetail(no);
    }

    @Override
    public void noticeInsert(Notice notice) throws Exception {
        noticeMapper.noticeInsert(notice);
    }

    @Override
    public void noticeEdit(Notice notice) throws Exception {
        noticeMapper.noticeEdit(notice);
    }

    @Override
    public void noticeDelete(int no) throws Exception {
        noticeMapper.noticeDelete(no);
    }

    @Override
    public int noticeCount(Page page) throws Exception {
        return noticeMapper.noticeCount(page);
    }
}
