package kr.ed.haebeop.service;


import kr.ed.haebeop.domain.Comment;
import kr.ed.haebeop.persistence.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<Comment> commentList(int par) throws Exception {
        return commentMapper.commentList(par);
    }

    @Override
    public void commentInsert(Comment dto) throws Exception {
        commentMapper.commentInsert(dto);
    }

    @Override
    public void commentEdit(Comment dto) throws Exception {
        commentMapper.commentEdit(dto);
    }

    @Override
    public void commentDelete(int cno) throws Exception {
        commentMapper.commentDelete(cno);
    }
}
