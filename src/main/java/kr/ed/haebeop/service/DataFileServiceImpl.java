package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.DataFile;
import kr.ed.haebeop.persistence.DataFileMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DataFileServiceImpl implements DataFileService {

    @Autowired
    private DataFileMapper dataFileMapper;

    @Override
    public List<DataFile> dataFileList() throws Exception {
        return dataFileMapper.dataFileList();
    }

    @Override
    public List<DataFile> dataFileBoardList(DataFile dataFile) throws Exception {
        return dataFileMapper.dataFileBoardList(dataFile);
    }

    @Override
    public DataFile dataFileDetail(int fno) throws Exception {
        return dataFileMapper.dataFileDetail(fno);
    }

    @Override
    public int dataFileCount() throws Exception {
        return dataFileMapper.dataFileCount();
    }

    @Override
    public void dataFileInsert(DataFile dataFile) throws Exception {
        dataFileMapper.dataFileInsert(dataFile);
    }

    @Override
    public void dataFileEdit(DataFile dataFile) throws Exception {
        dataFileMapper.dataFileEdit(dataFile);
    }

    @Override
    public void dataFileDelete(int fno) throws Exception {
        dataFileMapper.dataFileDelete(fno);
    }
}
