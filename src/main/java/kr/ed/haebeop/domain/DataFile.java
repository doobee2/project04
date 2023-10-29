package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DataFile {
    private int dno;
    private String fileName;
    private String saveName;
    private String fileType;
    private String relations;
    private int bno;
    private String saveFolder;
}
