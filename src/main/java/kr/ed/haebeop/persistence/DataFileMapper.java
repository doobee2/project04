package kr.ed.haebeop.persistence;


import kr.ed.haebeop.domain.DataFile;

import java.util.List;

public interface DataFileMapper {
    // DataFile
    public List<DataFile> dataFileList() throws Exception;
    public List<DataFile> dataFileBoardList(DataFile dataFile) throws Exception;
    public DataFile dataFileDetail(int fno) throws Exception;
    public int dataFileCount() throws Exception;
    public void dataFileInsert(DataFile dataFile) throws Exception;
    public void dataFileEdit(DataFile dataFile) throws Exception;
    public void dataFileDelete(int fno) throws Exception;
}
