package com.kh.meetgo.gosu.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.common.template.Pagination;
import com.kh.meetgo.gosu.model.dto.GosuOpt;
import com.kh.meetgo.gosu.model.service.GosuServiceImpl;
import com.kh.meetgo.member.model.vo.Gosu;
import com.kh.meetgo.member.model.vo.Member;

@Controller
public class GosuController {
    
    @Autowired
    private GosuServiceImpl gosuService;
    
    // 고수 등록페이지로 이동
    @RequestMapping("gosuEnrollForm.go")
    public String gosuEnroll() {
       return "gosu/gosuEnrollForm";
    }
    
    // 고수 등록
    @RequestMapping(value = "insert.go")
    public String insertGosu(Gosu gosu, String regionMain, String regionSub, String selectedArr, HttpSession session, Model model ) {
       
       Gson gson = new Gson();
        String[] selectedArray = gson.fromJson(selectedArr, String[].class);
        
        Member m = (Member)session.getAttribute("loginUser");
        
        gosu.setUserNo(m.getUserNo());
        gosu.setGosuNo(m.getUserNo());
        
        String region = "";
        
        if(regionSub.equals("전체")) { // 시/도 - 전체 지역 선택 시
          
          region = regionMain;
          
       } else {
          
          region = regionMain + " " + regionSub;
       }
        
        gosu.setRegion(region);
        
        System.out.println(gosu);
        
        int result = gosuService.insertGosu(gosu);
        
        if(result > 0) {
           
           int result1 = 0;
           
           for (String service : selectedArray) {
              result1    += gosuService.insertGosuCate(Integer.parseInt(service), gosu.getGosuNo());
           }
           
           if(selectedArray.length == result1) {
              
              int result2 = gosuService.changeStatus(gosu.getUserNo());
           }
           
           session.setAttribute("alertMsg", "성공적으로 고수 등록이 완료되었습니다.");

           return "redirect:/";
           
           
        } else {
           
           model.addAttribute("errorMsg", "고수 등록에 실패하였습니다.");
           
           return "common/errorPage";
        }
    
    }
    
    
    // 고수찾기 페이지로 이동
    @ResponseBody
    @RequestMapping("searchMain.go")
    public ModelAndView sendToSearchMain(ModelAndView mv
    				  , @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
    	
    	int listCount = gosuService.selectAllGosuCount();
    	
    	PageInfo pi = new PageInfo();
    	int pageLimit = 5;
        int boardLimit = 10;
        
    	pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
    	
    	ArrayList<GosuOpt> list = new ArrayList<>();
    	list = gosuService.selectAllGosu(pi);
    	
    	mv.addObject("list", list).addObject("pi", pi).setViewName("gosuSearch/searchMain");
    	
       return mv;
    }
    
    // 고수 지역 선택
    @ResponseBody
    @RequestMapping(value = "searchGosu.go", produces = "text/html; charset=UTF-8")
    public ModelAndView selectOptionResult(String regionMain, String regionSub
                            , String categoryMain, String categorySub
                            , ModelAndView mv
                            , @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
    	
       mv.addObject("regionMain", regionMain)
       .addObject("regionSub", regionSub)
       .addObject("categoryMain", categoryMain)
       .addObject("categorySub", categorySub);
       
       int listCount = 0;
       PageInfo pi = new PageInfo();
       
       int pageLimit = 5;
       int boardLimit = 10;
       
       // 고수의 지역
       String region = regionMain + " " + regionSub;
       
       ArrayList<GosuOpt> list = new ArrayList<>();
       
       // 고수의 서비스
       int categoryBigNo = Integer.parseInt(categoryMain);
       int categorySmallNo = Integer.parseInt(categorySub);      
       
       if(regionSub.equals("전체") && (categoryBigNo > 0)) { // 지역 전체 선택 | 서비스 선택
          
          region = regionMain;
          
          listCount = gosuService.selectAllRegionOptionResultCount(region, categoryBigNo, categorySmallNo);
          
          pi = Pagination.getPageInfo(listCount, 
                currentPage, pageLimit, boardLimit);
          
          list = gosuService.selectAllRegionOptionResult(region, categoryBigNo, categorySmallNo, pi);    
          
          mv.addObject("list", list).addObject("pi", pi).setViewName("gosuSearch/searchMain");
       } else if(!regionSub.equals("전체") && categoryBigNo > 0) { // 지역 선택 | 서비스 선택
          
          listCount = gosuService.selectRegionOptionResultCount(region, categoryBigNo, categorySmallNo);
          
          pi = Pagination.getPageInfo(listCount, 
                currentPage, pageLimit, boardLimit);
          
          list = gosuService.selectRegionOptionResult(region, categoryBigNo, categorySmallNo, pi);
          
          mv.addObject("list", list).addObject("pi", pi).setViewName("gosuSearch/searchMain");
       } else if(regionSub.equals("전체") && (categoryBigNo == 0)) { // 지역 전체 선택 | 서비스 전체 선택
          
          region = regionMain;
          
          listCount = gosuService.selectAllRegionGosuCount(region, categoryBigNo, categorySmallNo);
          
          pi = Pagination.getPageInfo(listCount, 
                currentPage, pageLimit, boardLimit);
          
          list = gosuService.selectAllRegionGosu(region, categoryBigNo, categorySmallNo, pi);
          
          mv.addObject("list", list).addObject("pi", pi).setViewName("gosuSearch/searchMain");

       } else if(regionMain.equals("전국") && categoryBigNo == 0) {
    	   
    	   listCount = gosuService.selectAllGosuCount();
           
           pi = Pagination.getPageInfo(listCount, 
                 currentPage, pageLimit, boardLimit);
    	   
    	   list = gosuService.selectAllGosu(pi);
       	
       		mv.addObject("list", list).addObject("pi", pi).setViewName("gosuSearch/searchMain");
       } else { // 지역 선택 | 서비스 전체 선택
          listCount = gosuService.selectRegionGosuCount(region, categoryBigNo, categorySmallNo);
          
          pi = Pagination.getPageInfo(listCount, 
                currentPage, pageLimit, boardLimit);
          
          list = gosuService.selectRegionGosu(region, categoryBigNo, categorySmallNo, pi);
          
          mv.addObject("list", list).addObject("pi", pi).setViewName("gosuSearch/searchMain");
          
       }

       System.out.println(pi);
       
       return mv;
    }
    
    
    
}