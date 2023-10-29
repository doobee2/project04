package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Subject;
import kr.ed.haebeop.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/subject/*")
public class SubjectCtrl {

    @Autowired
    private SubjectService subjectService;

    @Autowired
    HttpSession session;

    @GetMapping("add.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/admin/lectDetail";
    }

    @PostMapping("add.do")
    public String subjectInsert(HttpServletRequest request, Model model) throws Exception {
        Subject subject = new Subject();
        subject.setTitle(request.getParameter("title"));

        subjectService.subjectAdd(subject);
        return "redirect:/admin/lectGet.do?fno="+request.getParameter("par");
    }

    @GetMapping("delete.do")
    public String subjectDelete(HttpServletRequest request, Model model) throws Exception {
        int sno = Integer.parseInt(request.getParameter("sno"));
        subjectService.subjectDelete(sno);

        return "/admin/lectGet";
    }
}
