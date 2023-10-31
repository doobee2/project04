package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.service.*;
import kr.ed.haebeop.util.LecturePage;
import kr.ed.haebeop.util.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminCtrl {

    @Autowired
    HttpSession session;

    @Autowired
    private MemberService memberService;

    @Autowired
    private MemberMgnService memberMgnService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private LectureService lectureService;

    @Autowired
    private CurriService curriService;

    @Autowired
    private SubjectService subjectService;

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private FreeService freeService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String adminpage(Locale locale, Model model) throws Exception {
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String today = dateFormat.format(date);

        List<Review> reviewList = reviewService.reviewList_main();
        model.addAttribute("reviewList", reviewList);

        List<LectureVO> lectureList = lectureService.lectureList_main();
        model.addAttribute("lectureList", lectureList);

        model.addAttribute("today", today);
        model.addAttribute("title", "해법");

        return "/admin/adminpage";
    }

    @GetMapping("/memberConf.do")
    public String memberList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = memberService.memberCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Member> memberList = memberService.memberList(page);
        model.addAttribute("memberList", memberList);

        return "/admin/memberList";
    }

    @GetMapping("/memberMgnConf.do")
    public String memberMgnList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type") != null ? request.getParameter("type") : "";
        String keyword = request.getParameter("keyword") != null ? request.getParameter("keyword") : "";
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        int total = memberMgnService.memberMgnCount();

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);


        return "/admin/memberApprove";
    }

    //notice------------------------------------------------

    @RequestMapping(value = "noticeList.do", method = RequestMethod.GET)
    public String noticeList(HttpServletRequest request, Model model) throws Exception{

        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;


        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = noticeService.noticeCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);


        List<Notice> noticeList = noticeService.noticeList(page);
        model.addAttribute("noticeList", noticeList);
        return "/admin/noticeList";
    }

    @GetMapping("noticeDetail.do")
    public String noticeDetail(HttpServletRequest request, Model model) throws Exception{
        int no = Integer.parseInt(request.getParameter("no"));
        Notice notice = noticeService.noticeDetail(no);
        model.addAttribute("notice", notice);
        return "/admin/noticeDetail";
    }

    @GetMapping("noticeInsert.do")
    public String noticeInsert(HttpServletRequest request, Model model) throws Exception{
        return "/admin/noticeInsert";
    }

    @PostMapping("noticeInsert.do")
    public String noticeInsertpro(HttpServletRequest request, Model model) throws Exception{
        Notice notice = new Notice();
        notice.setTitle(request.getParameter("title"));
        notice.setContent(request.getParameter("content"));
        noticeService.noticeInsert(notice);
        return "redirect:/admin/List.do";
    }

    @GetMapping("noticeEdit.do")
    public String noticeEdit(HttpServletRequest request, Model model) throws Exception{
        int no = Integer.parseInt(request.getParameter("no"));
        Notice notice = noticeService.noticeDetail(no);
        model.addAttribute("notice", notice);
        return "/admin/noticeEdit";
    }

    @PostMapping("noticeEdit.do")
    public String noticeEditpro(HttpServletRequest request, Model model) throws Exception{
        int no = Integer.parseInt(request.getParameter("no"));
        Notice notice = new Notice();
        notice.setNo(no);
        notice.setTitle(request.getParameter("title"));
        notice.setContent(request.getParameter("content"));
        noticeService.noticeEdit(notice);
        return "redirect:/admin/List.do";
    }

    @GetMapping("noticeDelete.do")
    public String noticeDelete(HttpServletRequest request, Model model) throws Exception{
        int no = Integer.parseInt(request.getParameter("no"));
        noticeService.noticeDelete(no);
        return "redirect:/admin/List.do";
    }

    //free------------------------------------------------
    @GetMapping("FreeListAdmin.do")		//free/list.do
    public String getfreeList(HttpServletRequest request, Model model) throws Exception {

        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = freeService.totalCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);


        List<Free> freeList = freeService.freeList(page);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);


        model.addAttribute("freeList", freeList);
        return "/admin/freeList";
    }

    @GetMapping("freeDetail.do")	//free/get.do?fno=1
    public String getFree(HttpServletRequest request, Model model) throws Exception {
        int fno = Integer.parseInt(request.getParameter("fno"));
        Free dto = freeService.freeDetail(fno);
        List<Comment> commentList = commentService.commentList(fno);
        model.addAttribute("commentList", commentList);
        model.addAttribute("dto", dto);
        model.addAttribute("fno", fno);
        System.out.println("dto : " + dto);
        System.out.println("commentList : " + commentList);
        System.out.println("fno : " + fno);
        return "/admin/freeDetail";
    }

    //강의
    @GetMapping("/lectList.do")
    public String lectviewList(HttpServletRequest request, Model model) throws Exception{
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        LecturePage page = new LecturePage();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = lectureService.lectviewCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<LectureVO> lectviewList = lectureService.lectviewList(page);
        model.addAttribute("lectviewList", lectviewList);
        for(LectureVO ldd : lectviewList) {
            System.out.println(ldd.toString());
        }
        return "/admin/lectList";
    }

    @GetMapping("/lectAdd.do")
    public String lectureAdd(Model model) throws Exception {
        return "/admin/lectAdd";
    }

    @PostMapping("lectAdd.do")
    public String lectureInsertpro(HttpServletRequest request, Model model, MultipartFile thumbnail, MultipartFile lvideo, MultipartFile bthumbnail) throws Exception{
        String msg = "";

        ServletContext application = request.getSession().getServletContext();
        //String realPath = application.getRealPath("/resources/upload/lecture");       // 운영 서버
        String realPath = "D:\\seulbee\\uploadtest";

        Lecture lecture = new Lecture();
        lecture.setTitle(request.getParameter("title"));
        lecture.setSubTitle(request.getParameter("subTitle"));
        lecture.setContent(request.getParameter("content"));
        lecture.setBthumbnail(request.getParameter("thumbnail"));
        lecture.setTeacherId(request.getParameter("teacherId"));
        lecture.setTeacherNm(request.getParameter("teacherNm"));
        lecture.setBookname(request.getParameter("bookname"));
        lecture.setBthumbnail(request.getParameter("bthumbnail"));
        lecture.setLectureType(Integer.parseInt(request.getParameter("lectureType")));
        lecture.setStudentCnt(Integer.parseInt(request.getParameter("studentCnt")));
        lecture.setCost(Integer.parseInt(request.getParameter("cost")));
        lecture.setSno(Integer.parseInt(request.getParameter("sno")));


        if(thumbnail != null) {
            String originalThumbnailname = thumbnail.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            String uploadThumbnailname = uuid.toString() + "_" + originalThumbnailname;
            thumbnail.transferTo(new File(realPath, uploadThumbnailname));     //파일 등록
            lecture.setThumbnail(uploadThumbnailname);
        }
        if(lvideo != null) {
            String originalFilename = lvideo.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            String uploadFilename = uuid.toString() + "_" + originalFilename;
            lvideo.transferTo(new File(realPath, uploadFilename));     //파일 등록
            lecture.setLvideo(uploadFilename);
        }
        if(bthumbnail != null) {
            String originalFilename = bthumbnail.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            String uploadFilename = uuid.toString() + "_" + originalFilename;
            bthumbnail.transferTo(new File(realPath, uploadFilename));     //파일 등록
            lecture.setBthumbnail(uploadFilename);
        }

        lectureService.lectureAdd(lecture);
        return "redirect:/admin/lectList.do";
    }

    @GetMapping("/findTeacher.do")
    public String findTeacher(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = memberService.memberTeacherCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Member> teacherList = memberService.memberTeacherList(page);
        model.addAttribute("teacherList", teacherList);

        return "/admin/findTeacher";
    }

    @GetMapping("/findLecture.do")
    public String findLecture(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        LecturePage page = new LecturePage();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = lectureService.lectureCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Lecture> lectureList = lectureService.lectureList(page);
        model.addAttribute("lectureList", lectureList);

        return "/admin/findLecture";
    }

    @GetMapping("lectGet.do")
    public String lectureGet(HttpServletRequest request, Model model) throws Exception{
        int lno = Integer.parseInt(request.getParameter("lno"));

        Lecture lecture = lectureService.lectureGet(lno);
        Member teacher = memberService.memberGet(lecture.getTeacherId());
        Subject subject = subjectService.subjectGet(lecture.getSno());
        List<Curri> curriList = curriService.curriList(lno);

        model.addAttribute("curriList", curriList);
        model.addAttribute("subject", subject);
        model.addAttribute("lecture", lecture);
        model.addAttribute("lno", lno);
        model.addAttribute("teacher", teacher);

        return "/admin/lectGet";
    }

    @GetMapping("lectUpdate.do")
    public String lectureUpdate(HttpServletRequest request, Model model) throws Exception{
        int lno = Integer.parseInt(request.getParameter("lno"));
        Lecture lecture = lectureService.lectureGet(lno);
        model.addAttribute("lecture", lecture);
        return "/admin/lectUpdate";
    }

    @PostMapping("lectUpdate.do")
    public String lectureUpdatepro(HttpServletRequest request, Model model, MultipartFile thumbnail, MultipartFile lvideo, MultipartFile bthumbnail) throws Exception{

        int lno = Integer.parseInt(request.getParameter("lno"));

        ServletContext application = request.getSession().getServletContext();
        //String realPath = application.getRealPath("/resources/upload");       // 운영 서버
        String realPath = "D:\\seulbee\\uploadtest";

        Lecture lecture = new Lecture();
        lecture.setLno(lno);
        lecture.setTitle(request.getParameter("title"));
        lecture.setSubTitle(request.getParameter("subTitle"));
        lecture.setContent(request.getParameter("content"));
        lecture.setBthumbnail(request.getParameter("thumbnail"));
        lecture.setTeacherId(request.getParameter("teacherId"));
        lecture.setTeacherNm(request.getParameter("teacherNm"));
        lecture.setBookname(request.getParameter("bookname"));
        lecture.setBthumbnail(request.getParameter("bthumbnail"));
        lecture.setLectureType(Integer.parseInt(request.getParameter("lectureType")));
        lecture.setStudentCnt(Integer.parseInt(request.getParameter("studentCnt")));
        lecture.setCost(Integer.parseInt(request.getParameter("cost")));
        lecture.setSno(Integer.parseInt(request.getParameter("sno")));



        if(thumbnail != null) {
            String originalThumbnailname = thumbnail.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            String uploadThumbnailname = uuid.toString() + "_" + originalThumbnailname;
            thumbnail.transferTo(new File(realPath, uploadThumbnailname));     //파일 등록
            lecture.setThumbnail(uploadThumbnailname);
        }
        if(lvideo != null) {
            String originalFilename = lvideo.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            String uploadFilename = uuid.toString() + "_" + originalFilename;
            lvideo.transferTo(new File(realPath, uploadFilename));     //파일 등록
            lecture.setLvideo(uploadFilename);
        }
        if(bthumbnail != null) {
            String originalFilename = bthumbnail.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            String uploadFilename = uuid.toString() + "_" + originalFilename;
            bthumbnail.transferTo(new File(realPath, uploadFilename));     //파일 등록
            lecture.setBthumbnail(uploadFilename);
        }

        lectureService.lectureUpdate(lecture);
        return "redirect:/admin/lectList.do";
    }

    @GetMapping("lectDelete.do")
    public String lectureDelete(HttpServletRequest request, Model model) throws Exception{
        int lno = Integer.parseInt(request.getParameter("lno"));
        lectureService.lectureDelete(lno);
        return "redirect:/admin/lectList.do";
    }


    //관리자페이지 payList
    @GetMapping("/paylistAdmin.do")
    public String payment(HttpServletRequest request, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");

        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = paymentService.paymentCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<Payment> paymentList = paymentService.paymentList_admin(page);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);
        model.addAttribute("paymentList", paymentList);


        return "/admin/payList";

    }

    @GetMapping("memberget.do")
    public String memberGet(HttpServletRequest request, Model model) throws Exception {
        String id = (String) request.getParameter("id");
        Member member = memberService.memberGet(id);
        model.addAttribute("member", member);
        return "/admin/memberGet";
    }
}