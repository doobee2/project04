package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Comment;
import kr.ed.haebeop.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/comment/*")
public class CommentCtrl {

    @Autowired
    private CommentService commentService;

    @Autowired
    HttpSession session;

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/board/free/freeDetail";
    }

    @PostMapping("insert.do")
    public String commentInsert(HttpServletRequest request, Model model) throws Exception {
        Comment comment = new Comment();
        comment.setAuthor(request.getParameter("id"));
        comment.setContent(request.getParameter("content"));
        comment.setPar(Integer.parseInt(request.getParameter("par")));
        commentService.commentInsert(comment);
        return "redirect:/free/detail.do?fno="+request.getParameter("par");
    }

    @GetMapping("delete.do")
    public ModelAndView commentDelete(HttpServletRequest request, Model model) throws Exception {
        String sid = session.getAttribute("sid") != null ? (String) session.getAttribute("sid") : "";

        int cno = Integer.parseInt(request.getParameter("cno"));
        int fno = Integer.parseInt(request.getParameter("fno"));
        commentService.commentDelete(cno);
        model.addAttribute("fno", fno);
        ModelAndView mav = new ModelAndView();

        if(!sid.equals("admin")) {
            mav.setView(new RedirectView(request.getContextPath() + "/free/detail.do"));
        } else {
            mav.setView(new RedirectView(request.getContextPath() + "/admin/freeDetail.do"));
        }
        return mav;
        //String referer = request.getHeader("Referer");      // 요청한 페이지를 기억해서 보냄
        //System.out.println(referer);
        //return "redirect:/" + referer;
//        RedirectView redirectView = new RedirectView();
//        redirectView.setUrl("http://www.naver.com");
//        return redirectView;
    }
}
