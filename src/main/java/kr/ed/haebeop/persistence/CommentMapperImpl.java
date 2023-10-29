package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Comment;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentMapperImpl implements CommentMapper {

    @Autowired
    private SqlSession sqlSession;


    @Override
    public List<Comment> commentList(int par) throws Exception {
        return sqlSession.selectList("comment.commentList", par);
    }

    @Override
    public void commentInsert(Comment dto) throws Exception {
        sqlSession.insert("comment.commentInsert", dto);
    }

    @Override
    public void commentEdit(Comment dto) throws Exception {
        sqlSession.update("comment.commentEdit", dto);
    }

    @Override
    public void commentDelete(int cno) throws Exception {
        sqlSession.delete("comment.commentDelete", cno);
    }
}
