package com.kh.meetgo.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.meetgo.board.model.service.BoardService;
import com.kh.meetgo.board.model.vo.Board;
import com.kh.meetgo.board.model.vo.Reply;
import com.kh.meetgo.common.config.S3Uploader;
import com.kh.meetgo.common.model.service.CommonService;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.common.template.Pagination;
import com.kh.meetgo.gosu.model.dto.PofolOpt;
import com.kh.meetgo.gosu.model.vo.Pofol;
import com.kh.meetgo.member.model.vo.Member;

@Controller
public class BoardController {
	
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private S3Uploader s3Uploader;
	private CommonService commonService;


	@RequestMapping("gosuList.bo")
	public String test() {
		return "board/gosuRequest/gosuList";
	}
	
	@RequestMapping("noticeWrite.bo")
	public String noticeForm() {
		return "board/notice/noticeWrite";
	}
	
	@RequestMapping("tipList.bo")
	public String tipList() {
		return "board/tip/tipList";
	}
	@RequestMapping("noticeList.bo")
	public String noticeList() {
		return "board/notice/noticeList";
	}
	
	@GetMapping("gosuWrite.bo")
	public String enrollForm() {
		return "board/gosuRequest/gosuWrite";
	}
	
	@GetMapping("tipWrite.bo")
	public String tipForm() {
		return "board/tip/tipWrite";
	}
	
	// 고수찾아요 게시판리스트 조회
	@GetMapping("gosuList.bo")
	public ModelAndView selectGosuReqList(
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {
		
		int listCount = boardService.selectGosuReqListCount();
		
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, 
						currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> list = boardService.selectGosuReqList(pi);
		

		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("board/gosuRequest/gosuList");
		return mv;
	}
	
	// 고수찾아요 게시판 등록
	@PostMapping("insert.bo")
	public String insertGosuReqBoard(Board m, 
							  MultipartFile upfile,
							  HttpSession session,
							  Model model) {
		
		int result = boardService.insertGosuReqBoard(m);
		
		if(result > 0) { 
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			
			return "redirect:/gosuList.bo"; // 첫 페이지로 이동
			
		} else { 
			model.addAttribute("errorMsg", "게시글 등록 실패");
			
			return "common/errorPage";
		}
	}
	
	// 고수찾아요 게시판 상세조회	
	@RequestMapping("detail.bo")
	public ModelAndView selectGosuReqBoard(int bno, 
									ModelAndView mv) {
		
		
		
		int result = boardService.increaseGosuReqCount(bno);
		
		if(result > 0) { 
			
			Board m = boardService.selectGosuReqBoard(bno);
			
			mv.addObject("m", m)
			  .setViewName("board/gosuRequest/gosuDetail"); 
			
			
		} else { 
			
			mv.addObject("errorMsg", "게시글 상세조회 실패")
			  .setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 팁 노하우 게시판 리스트 조회
	@GetMapping("tipList.bo")
	public ModelAndView selectTipList(
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {
		
		int listCount = boardService.selectTipListCount();
		
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, 
						currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> list = boardService.selectTipList(pi);
		

		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("board/tip/tipList");
		return mv;
	}
	
	
	
	// 팁 노하우 게시판 등록
	@PostMapping("tipInsert.bo")
	public String insertTipBoard(Board m, 
							  MultipartFile upfile,
							  HttpSession session,
							  Model model) {
			
		int result = boardService.insertTipBoard(m);
		
		if(result > 0) { 
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			
			return "redirect:/tipList.bo"; // 첫 페이지로 이동
			
		} else { 
			model.addAttribute("errorMsg", "게시글 등록 실패");
			
			return "common/errorPage";
		}
	}
	
	
	// 팁노하우 게시판 상세 조회
	@RequestMapping("tipDetail.bo")
	public ModelAndView selectTipBoard(int bno, 
									ModelAndView mv) {
	
		
		int result = boardService.increaseTipCount(bno);
		
		if(result > 0) { 
			
			Board m = boardService.selectTipBoard(bno);
			
			mv.addObject("m", m)
			  .setViewName("board/tip/tipDetail"); 
			
		} else { 
			
			mv.addObject("errorMsg", "게시글 상세조회 실패")
			  .setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	
	
	@RequestMapping("sendPofol.po")
	public String sendPofolList() {
		return "board/portfolio/pofolList";
	}
	
	// 포트폴리오 게시판
	@ResponseBody
	@RequestMapping(value = "pofolListOrderBy.po", produces = "text/json; charset=UTF-8")
	public String selectPofolList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage
		 , @RequestParam(value = "standard") String standard
		 , @RequestParam(value = "category") String category) {

		int listCount = boardService.countPofolList();
		int pageLimit = 5;
		int boardLimit = 9;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		int categoryBigNo = Integer.parseInt(category);
		
		// 전체 내용 리스트
		ArrayList<PofolOpt> list = boardService.selectPofolList(pi, standard, categoryBigNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pi", pi);
		return new Gson().toJson(map);
	}

	@ResponseBody
	@RequestMapping("sendPofolWrite.po")
	public ModelAndView sendPofolWrite(@SessionAttribute("loginUser") Member loginUser
								, ModelAndView mv) {
		
		int userNo = loginUser.getUserNo();
		
		ArrayList<String> loginUserCtgName = boardService.getLoginUserCtgName(userNo);
		
		mv.addObject("loginUserCtgName", loginUserCtgName).setViewName("board/portfolio/pofolWrite");
		return mv;
	}
	
	@ResponseBody
	@PostMapping(value = "pofolWrite.po", produces = "text/json; charset=UTF-8")
	public String pofolWrite(ArrayList<MultipartFile> pofolImgArr
			  , @SessionAttribute("loginUser") Member loginUser
			  , String categorySmallNo
			  ,	String pofolTitle
			  , String pofolIntro
			  , String pofolPrice
			  , String pofolContent, Model model) {
		
		int gosuNo = loginUser.getUserNo(); // 고수번호
		
		Pofol pofol = new Pofol();
		pofol.setGosuNo(gosuNo);
		pofol.setPofolService(categorySmallNo);
		pofol.setPofolTitle(pofolTitle);
		pofol.setPofolIntro(pofolIntro);
		pofol.setPofolPrice(pofolPrice);
		pofol.setPofolContent(pofolContent);
		
		// 게시글 먼저 등록
		int result1 = boardService.insertPofol(pofol);
		
		int pofolNo = pofol.getPofolNo();
		
		System.out.println(pofolNo);
		
		int result2 = 0;
				 
		try {
			for(int i = 0; i < pofolImgArr.size(); i++) {
				String pofolImgUrl = s3Uploader.upload(pofolImgArr.get(i), "pofolImg");
				result2 = boardService.insertPofolImg(pofolImgUrl, pofolNo);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String alertMsg = "";
		
		if(result1 > 0 && result2 > 0) {
			System.out.println("등록 성공");
			alertMsg = "포트폴리오 등록 성공";
		} else {
			System.out.println("등록 실패");
			alertMsg = ("포트폴리오 등록 실패");
		}	
		
		model.addAttribute("alertMsg", alertMsg);
		
		return "board/portfolio/pofolList";
		
	}
	
	@RequestMapping("pofolDetail.po")
	public String pofolDetail() {
		return "board/portfolio/pofolDetail";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "rlist.bo", produces = "application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int bno) {
		
		ArrayList<Reply> list = boardService.selectReplyList(bno);
		
		// Gson gson = new Gson();
		// return gson.toJson(list);
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "rinsert.bo", produces = "text/html; charset=UTF-8")
	public String ajaxInsertReply(Reply r) {
		
		// System.out.println(r);
		
		int result = boardService.insertReply(r);
		
		return (result > 0) ? "success" : "fail";
	}
	
	
	
	
}