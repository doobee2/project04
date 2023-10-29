package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Databoard;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface DataboardMapper {
    public List<Databoard> databoardList(Page page) throws Exception;
    public Databoard databoardDetail(int no) throws Exception;
    public int databoardCount(Page page) throws Exception;
    public void databoardInsert(Databoard databoard) throws Exception;
    public void databoardEdit(Databoard databoard) throws Exception;
    public void databoardDelete(int no) throws Exception;
}
