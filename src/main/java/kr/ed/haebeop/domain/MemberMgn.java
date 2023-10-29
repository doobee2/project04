package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberMgn {

    private int mmNo;
    private String author;
    private boolean approveYn;
    private int mStatus;
    private String content;

}