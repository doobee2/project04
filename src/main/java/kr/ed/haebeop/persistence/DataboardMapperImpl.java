package kr.ed.haebeop.persistence;


import kr.ed.haebeop.domain.DataFile;
import kr.ed.haebeop.domain.Databoard;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class DataboardMapperImpl implements DataboardMapper {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Databoard> databoardList(Page page) throws Exception {
        return sqlSession.selectList("databoard.databoardList", page);
    }

    @Transactional
    @Override
    public Databoard databoardDetail(int bno) throws Exception {
        sqlSession.update("databoard.databoardCountUp", bno);
        return sqlSession.selectOne("databoard.databoardDetail", bno);
    }

    @Override
    public int databoardCount(Page page) throws Exception {
        return sqlSession.selectOne("databoard.databoardCount", page);
    }

    @Transactional
    @Override
    public void databoardInsert(Databoard databoard) throws Exception {
        sqlSession.insert("Databoard.databoardInsert", databoard);
        Databoard last = sqlSession.selectOne("Databoard.databoardGetLast");
        int bno = last.getBno();

        List<DataFile> datafiles = sqlSession.selectList("dataFile.dataFileInsertList");
        for(DataFile df: datafiles){
            df.setBno(bno);
            df.setRelations("databoard");
            sqlSession.update("dataFile.dataFileEdit", df);
        }

        if(!datafiles.isEmpty()){
            last.setRelations("datafile");
            sqlSession.update("board.dataBoardEdit", last);
        }
    }

    @Override
    public void databoardEdit(Databoard databoard) throws Exception {
        sqlSession.update("databoard.databoardEdit", databoard);
    }

    @Override
    public void databoardDelete(int bno) throws Exception {
        sqlSession.delete("databoard.databoardDelete", bno);
    }
}
