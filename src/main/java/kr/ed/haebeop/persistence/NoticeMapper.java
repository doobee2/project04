package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Notice;
import kr.ed.haebeop.domain.User;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

//mapper2버전 경우 Mapper.xml에서 연결하기 때문에 @Select 등의 구문 사용 안해도 됨.
@Mapper
public interface NoticeMapper {

    public List<Notice> noticeList(Page page);

    public Notice noticeListPro();

    public Notice noticeDetail(int no);

    public int noticeCount(Page page);

    public void noticeListForMain(User user);

    public void noticeInsert(Notice notice);

    public void noticeEdit(Notice notice);

    public void noticeDelete(int no);

    public Notice noticeVisited(int no);


}
