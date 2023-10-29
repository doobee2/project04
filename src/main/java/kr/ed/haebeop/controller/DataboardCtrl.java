package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.DataFile;
import kr.ed.haebeop.domain.Databoard;
import kr.ed.haebeop.service.DataFileService;
import kr.ed.haebeop.service.DataboardService;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/databoard/*")
public class DataboardCtrl {

    @Autowired
    private DataboardService databoardService;

    @Autowired
    private DataFileService dataFileService;

    @Autowired
    HttpSession session;

    @GetMapping("list.do")
    public String databoardList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = databoardService.databoardCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Databoard> databoardList = databoardService.databoardList(page);
        model.addAttribute("databoardList", databoardList);
        return "/board/data/dataList";
    }

    @GetMapping("detail.do")
    public String databoardDetail(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        Databoard dto = databoardService.databoardDetail(bno);
        DataFile temp = new DataFile();
        temp.setBno(bno);
        temp.setRelations("databoard");
        List<DataFile> dataFiles = dataFileService.dataFileBoardList(temp);

        model.addAttribute("dto", dto);
        model.addAttribute("dataFiles", dataFiles);
        return "/board/data/dataDetail";
    }

    @GetMapping("insert.do")
    public String databoardInsertForm() {
        return "/board/data/dataInsert";
    }


    @PostMapping("insert.do")
    public String databoardInsert(MultipartHttpServletRequest files, HttpServletRequest req, Model model) throws Exception {
        //String realFolder = req.getRealPath("/resources/upload");
        String realFolder = "D:\\seulbee\\project04\\src\\main\\webapp\\resources\\upload";

        Databoard dto = new Databoard();

        Enumeration<String> e = files.getParameterNames();
        Map map = new HashMap();
        while (e.hasMoreElements()) {
            String name = e.nextElement();
            String value = files.getParameter(name);
            map.put(name, value);
        }

        dto.setTitle((String) map.get("title"));
        dto.setContent((String) map.get("content"));
        dto.setAuthor((String) map.get("sid"));

        String today = new SimpleDateFormat("yyMMdd").format(new Date());
        String saveFolder = realFolder + File.separator + today;
        File folder = new File(saveFolder);

        if(!folder.exists()){
            folder.mkdirs();
        }

        List<MultipartFile> fileList = files.getFiles("uploadFiles");

        for(MultipartFile multipartFile : fileList){
            String originalName = multipartFile.getOriginalFilename();
            if(!originalName.isEmpty()){
                String saveName = UUID.randomUUID().toString()+"_"+originalName;

                DataFile dataFile = new DataFile();
                dataFile.setBno(0);
                dataFile.setFileName(originalName);
                dataFile.setSaveName(saveName);
                dataFile.setFileType(multipartFile.getContentType());
                dataFile.setSaveFolder(today);

                dataFileService.dataFileInsert(dataFile);

                File savefile = new File(saveFolder, saveName);

                try{
                    multipartFile.transferTo(savefile);
                } catch (Exception except){
                    System.out.println(except.getMessage());
                }
            }
        }


        databoardService.databoardInsert(dto);

        return "redirect:/databoard/list.do";
    }

    @GetMapping("delete.do")
    public String databoardDelete(HttpServletRequest request) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        databoardService.databoardDelete(bno);

        return "redirect:/databoard/list.do";
    }

    @GetMapping("edit.do")
    public String databoardEditForm(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));

        Databoard dto = databoardService.databoardDetail(bno);
        DataFile temp = new DataFile();
        temp.setBno(bno);
        temp.setRelations("databoard");
        List<DataFile> dataFiles = dataFileService.dataFileBoardList(temp);

        model.addAttribute("dto", dto);
        model.addAttribute("dataFiles", dataFiles);

        return "/board/data/dataEdit";
    }

    @PostMapping("edit.do")
    public String databoardEditPro(MultipartHttpServletRequest files, HttpServletRequest req, Model model) throws Exception {
        //String realFolder = req.getRealPath("/resources/upload");
        String realFolder = "D:\\seulbee\\project04\\src\\main\\webapp\\resources\\upload";

        Databoard dto = new Databoard();

        Enumeration<String> e = files.getParameterNames();
        Map map = new HashMap();
        while (e.hasMoreElements()) {
            String name = e.nextElement();
            String value = files.getParameter(name);
            map.put(name, value);
        }

        int bno = Integer.parseInt((String) map.get("bno"));
        dto.setBno(bno);
        dto.setTitle((String) map.get("title"));
        dto.setContent((String) map.get("content"));

        String today = new SimpleDateFormat("yyMMdd").format(new Date());
        String saveFolder = realFolder + File.separator + today;
        File folder = new File(saveFolder);

        if(!folder.exists()){
            folder.mkdirs();
        }

        List<MultipartFile> fileList = files.getFiles("uploadFiles");

        for(MultipartFile multipartFile : fileList){
            String originalName = multipartFile.getOriginalFilename();
            if(!originalName.isEmpty()){
                String saveName = UUID.randomUUID().toString()+"_"+originalName;

                DataFile dataFile = new DataFile();
                dataFile.setBno(bno);
                dataFile.setFileName(originalName);
                dataFile.setSaveName(saveName);
                dataFile.setFileType(multipartFile.getContentType());
                dataFile.setSaveFolder(saveFolder);

                dataFileService.dataFileInsert(dataFile);

                File savefile = new File(saveFolder, saveName);

                try{
                    multipartFile.transferTo(savefile);
                } catch (Exception except){
                    System.out.println(except.getMessage());
                }
            }
        }


        databoardService.databoardEdit(dto);

        return "redirect:/databoard/list.do";
    }

}
