package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Test;
import kr.ed.haebeop.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/test/")
public class TestController {

    @Autowired
    private TestService testService;

    @GetMapping("getTestList1")
    public String getTestList1(Model model) throws Exception {
        List<Test> testList = testService.getTestList1();
        model.addAttribute("testList", testList);
        return "/test/getTestList";
    }

    @GetMapping("getTestList2")
    public String getTestList2(Model model) throws Exception {
        List<Test> testList = testService.getTestList2();
        model.addAttribute("testList", testList);
        return "/test/getTestList";
    }

    @GetMapping("getTestList3")
    public String getTestList3(Model model) throws Exception {
        List<Test> testList = testService.getTestList3();
        model.addAttribute("testList", testList);
        return "/test/getTestList";
    }

}