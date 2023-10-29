package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@Controller
public class HomeCtrl {


    @Autowired
    private ReviewService reviewService;

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private LectureService lectureService;

    @Autowired
    private MemberService memberService;

    @RequestMapping(value = "/")
    public String index(Locale locale, Model model) throws Exception {
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String today = dateFormat.format(date);

        List<Review> reviewList = reviewService.reviewList_main();
        model.addAttribute("reviewList", reviewList);

        List<LectureVO> lectureList = lectureService.lectureList_main();
        model.addAttribute("lectureList", lectureList);

        model.addAttribute("today", today);
        model.addAttribute("title", "해법");

        return "/index";
    }
    @RequestMapping(value = "/sample")
    public String sample(Model model) {
        return "/sample";
    }

    @RequestMapping(value = "/firework")
    public String firework(Model model) {
        return "/firework";
    }

    @RequestMapping(value = "/main")
    public String main(Model model) {
        return "/main";
    }

    @RequestMapping(value = "/intro")
    public String intro(Model model) {
        return "/company/intro";
    }

    @RequestMapping(value = "/map")
    public String map(Model model) {
        return "/company/map";
    }

    @RequestMapping(value = "/policy")
    public String policy(Model model) {
        return "/company/policy";
    }

    @RequestMapping(value = "/game")
    public String game(Model model) {
        return "/game";
    }
}