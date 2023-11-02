package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.service.*;
import kr.ed.haebeop.util.LecturePage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/lecture/*")
public class LectureCtrl {

    @Autowired
    HttpSession session;

    @Autowired
    private LectureService lectureService;

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private CurriService curriService;

    @Autowired
    private SubjectService subjectService;

    @Autowired
    private MemberService memberService;

    @Autowired
    private CommentService commentService;

    //회원이 보는 강의 리스트
    @GetMapping("/list.do")
    public String lectviewList(HttpServletRequest request, Model model) throws Exception{
        int sno = request.getParameter("sno") != null ? Integer.parseInt(request.getParameter("sno")) : 0;

        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        LecturePage page = new LecturePage();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        page.setSno(sno);
        int total = lectureService.lectviewCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);
        model.addAttribute("sno", sno);

        List<LectureVO> lectviewList = lectureService.lectviewList(page);
        model.addAttribute("lectviewList", lectviewList);

        return "/lecture/lectList";
    }

    //회원의 강의 상세보기
    @GetMapping("/get.do")
    public String lectureGet(HttpServletRequest request, Model model) throws Exception{
        String sid = (String) session.getAttribute("sid");
        int lno = Integer.parseInt(request.getParameter("lno"));
        LectlistVO lectlistVO = new LectlistVO();
        lectlistVO.setId(sid);
        lectlistVO.setLno(lno);
        int check = lectureService.check(lectlistVO);
        Lecture lecture = lectureService.lectureGet(lno);
        Member teacher = memberService.memberGet(lecture.getTeacherId());
        Subject subject = subjectService.subjectGet(lecture.getSno());
        List<Review> reviewList = reviewService.reviewList(lno);
        List<Curri> curriList = curriService.curriList(lno);

        model.addAttribute("check", check);
        model.addAttribute("teacher", teacher);
        model.addAttribute("reviewList", reviewList);
        model.addAttribute("subject", subject);
        model.addAttribute("curriList", curriList);
        model.addAttribute("lecture", lecture);
        model.addAttribute("lno", lno);

        return "/lecture/lectGet";

    }

}
