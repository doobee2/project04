package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Free;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface FreeMapper {
    public List<Free> freeList(Page page) throws Exception;
    public List<Free> freeListForMain() throws Exception;
    public int totalCount(Page page) throws Exception;
    public Free freeDetail(int fno) throws Exception;
    public void freeInsert(Free dto) throws Exception;
    public void freeEdit(Free dto) throws Exception;
    public void freeDelete(int fno) throws Exception;
}
