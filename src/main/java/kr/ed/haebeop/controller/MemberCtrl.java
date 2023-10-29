package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.service.*;
import kr.ed.haebeop.util.PayListmem;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/user/")
public class MemberCtrl {

    @Autowired
    private MemberService memberService;

    @Autowired
    private MemberMgnService memberMgnService;

    @Autowired
    private LectureService lectureService;

    @Autowired
    HttpSession session;

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private CurriService curriService;

    @Autowired
    private SubjectService subjectService;

    @GetMapping("term.do")
    public String term(Model model) throws Exception {
        return "/member/joinTerm";
    }

    @GetMapping("join.do")
    public String join(Model model) throws Exception {
        return "/member/join";
    }

    @RequestMapping(value="idCheckPro.do", method=RequestMethod.POST)
    public ResponseEntity idCheck(@RequestBody Member member) throws Exception {
        String id = member.getId();
        boolean result = memberService.idCheck(id);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @PostMapping("joinPro.do")
    public String joinPro(Member member, Model model) throws Exception {
        memberService.insert(member);
        return "redirect:/user/finish.do";
    }

    @GetMapping("finish.do")
    public String joinFinish(Model model) throws Exception {
        return "/member/joinFinish";
    }

    @GetMapping("login.do")
    public String login(HttpServletRequest request, Model model) throws Exception {
        String msg = request.getParameter("msg") != null ? request.getParameter("msg") : "";
        model.addAttribute("msg", msg);

        return "/member/login";
    }

    @PostMapping("loginPro.do")
    public String loginPro(@RequestParam String id, @RequestParam String pw, Model model) throws Exception {
        boolean pass = memberService.loginPro(id, pw);
        if (pass) {
            session.setAttribute("sid", id);
            model.addAttribute("msg", "로그인 되었습니다.");
            model.addAttribute("url", "/");
            return "/layout/alert";
        } else {
            model.addAttribute("msg", "로그인 정보가 맞지 않습니다.");
            model.addAttribute("url", "/user/login.do?msg=fail");
            return "/layout/alert";
        }
    }

    @GetMapping("/logout.do")
    public String logout(Model model) throws Exception {
        session.invalidate();
        model.addAttribute("msg", "로그아웃 되었습니다.");
        model.addAttribute("url", "/");
        return "/layout/alert";
    }

    @GetMapping("/fire")
    public String firepoint(HttpServletRequest req, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        int pt = 10000;
        Member member = memberService.memberGet(id);
        member.setPt(pt);
        member.setId(id);
        memberService.firepoint(member);
        return "redirect:/firework";
    }

    @GetMapping("/myPage.do")
    public String myPage(Model model) throws Exception {
        String sid = (String) session.getAttribute("sid");
        Member member = memberService.memberGet(sid);
        model.addAttribute("member", member);

        boolean canUpgrade = true;
        MemberMgnVO memberMgn = memberMgnService.memberMgnGet(sid);
        if(memberMgn != null && (memberMgn.getMStatus() == 1 || memberMgn.getMStatus() == 3 || memberMgn.getMStatus() == 4)) {
            canUpgrade = false;
        }
        model.addAttribute("canUpgrade", canUpgrade);

        return "/member/myPage";
    }

    @GetMapping("/myPageEdit.do")
    public String memberUpdate(Model model) throws Exception {
        String sid = (String) session.getAttribute("sid");
        Member member = memberService.memberGet(sid);
        model.addAttribute("member", member);
        return "/member/myPageEdit";
    }

    @PostMapping("/myPageEdit.do")
    public String memberUpdatePro(Member member, Model model) throws Exception {
        member.setId((String) session.getAttribute("sid"));
        memberService.updateMember(member);
        return "redirect:/user/myPage.do";
    }

    @GetMapping("/mypageRemoveUser.do")
    public String memberDeletePost(HttpServletRequest request, Model model) throws Exception {
        String sid = (String) session.getAttribute("sid");
        String id = request.getParameter("id");
        memberService.removeMember(id);
        if(sid.equals("admin")) {
            return "redirect:/admin/memberConf.do";
        } else {
            return "redirect:/user/logout.do";
        }
    }

    @GetMapping("/mypageChangePw.do")
    public String memberUpdatePw(Model model) throws Exception {
        String sid = (String) session.getAttribute("sid");
        Member member = memberService.memberGet(sid);
        model.addAttribute("member", member);
        return "/member/myPageEditPw";
    }

    @PostMapping("/mypageChangePw.do")
    public String memberUpdatePwPro(HttpServletRequest request, Model model, RedirectAttributes rttr) throws Exception {
        String sid = (String) session.getAttribute("sid");

        String checkPw = request.getParameter("checkPw");
        String pw = request.getParameter("pw");

        boolean pass = false;
        if(sid != "admin") {
            pass = memberService.loginPro(sid, checkPw);
            if(pass) {
                Member member = new Member();
                member.setId(sid);
                member.setPw(pw);
                memberService.updatePw(member);
                rttr.addFlashAttribute("msg", "pwSuccess");
                return "redirect:/user/myPage.do";
            } else {
                rttr.addFlashAttribute("msg", "fail");
                return "redirect:/user/mypageChangePw.do";
            }
        } else {
            return "redirect:/user/myPage.do";
        }
    }

    @GetMapping("/mypageChangeGrade.do")
    public String memberUpgrade(Model model) throws Exception {
        String sid = (String) session.getAttribute("sid");
        Member member = memberService.memberGet(sid);
        model.addAttribute("member", member);

        boolean showFailContent = false;
        MemberMgnVO memberMgnVO = memberMgnService.memberMgnGet(sid);
        model.addAttribute("memberMgnVO", memberMgnVO);
        if(memberMgnVO != null && memberMgnVO.getMStatus() == 2) {
            showFailContent = true;
        }
        model.addAttribute("showFailContent", showFailContent);

        return "/member/myPageUpgrade";
    }

    @GetMapping("/memberMgnAccept.do")
    public String memberUpgradeAccept(HttpServletRequest request, Model model) throws Exception {
        String urlPath = request.getHeader("referer");
        String id = request.getParameter("id");

        memberMgnService.memberMgnUpdateAccept(id);
        memberService.updateMemberForTeacher(id);

        return "redirect:" + urlPath;
    }

    @PostMapping("/memberMgnRefuse.do")
    @ResponseBody
    public boolean memberUpgradeRefuse(@RequestParam("no") int mmNo, @RequestParam("content") String content) throws Exception {
        MemberMgn memberMgn = new MemberMgn();
        memberMgn.setMmNo(mmNo);
        memberMgn.setContent(content);
        memberMgnService.memberMgnUpdate(memberMgn);
        return true;
    }

    //멤버 payList
    @GetMapping("/mypagePaylistMem.do")
    public String paymentMem(HttpServletRequest request, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");

        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        PayListmem page = new PayListmem();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        page.setId(id);
        int total = paymentService.paymentCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<Payment> paymentList = paymentService.paymentList_mypage(page);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);
        model.addAttribute("paymentList", paymentList);


        return "/member/payList";

    }


    //회원의 강의 상세보기
    @GetMapping("mypageLecture.do")
    public String myLecture(HttpServletRequest request, Model model) throws Exception{
        String id = (String) session.getAttribute("sid");
        int lno = Integer.parseInt(request.getParameter("lno"));

        Lecture lecture = lectureService.lectureGet(lno);
        Member member = memberService.memberGet(id);
        Subject subject = subjectService.subjectGet(lecture.getSno());
        List<Review> reviewList = reviewService.reviewList(lno);
        List<Curri> curriList = curriService.curriList(lno);

        model.addAttribute("reviewList", reviewList);
        model.addAttribute("member", member);
        model.addAttribute("subject", subject);
        model.addAttribute("curriList", curriList);
        model.addAttribute("lecture", lecture);

        return "/member/myLecture";

    }

    @GetMapping("/mypageLectList.do")
    public String myPage(HttpServletRequest request, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        List<LectlistVO> mylectList = lectureService.mylectList(id);
        model.addAttribute("mylectList", mylectList);
        System.out.println(mylectList.toString());

        return "/member/myLectList";
    }

}