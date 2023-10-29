package kr.ed.haebeop.domain;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class Comment {
    private int cno;
    private String author;
    private String content;
    private String regdate;
    private int par;
}
