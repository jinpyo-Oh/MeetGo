package com.kh.meetgo.board.controller;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.meetgo.board.model.service.BoardService;
import com.kh.meetgo.board.model.vo.Board;
import com.kh.meetgo.common.model.dto.PoFolRequest;
import com.kh.meetgo.common.model.service.CommonService;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.common.template.Pagination;
import com.kh.meetgo.gosu.model.dto.PofolOpt;

@Controller
public class BoardController {
	
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
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
	
	@GetMapping("list.bo")
	public ModelAndView selectList(
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {
		
		int listCount = boardService.selectListCount();
		
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, 
						currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> list = boardService.selectList(pi);
		

		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("board/gosuRequest/gosuList");
		  
		return mv;
	}
	
	@PostMapping("insert.bo")
	public String insertBoard(Board m, 
							  MultipartFile upfile,
							  HttpSession session,
							  Model model) {
		
		int result = boardService.insertBoard(m);
		
		if(result > 0) { 
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			
			return "redirect:/gosuList.bo"; // 첫 페이지로 이동
			
		} else { 
			model.addAttribute("errorMsg", "게시글 등록 실패");
			
			return "common/errorPage";
		}
	}
	
	@PostMapping("tipInsert.bo")
	public String insertTipboard(Board m, 
							  MultipartFile upfile,
							  HttpSession session,
							  Model model) {
			
		int result = boardService.insertTipboard(m);
		
		if(result > 0) { 
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			
			return "redirect:/tipList.bo"; // 첫 페이지로 이동
			
		} else { 
			model.addAttribute("errorMsg", "게시글 등록 실패");
			
			return "common/errorPage";
		}
	}
	
	@RequestMapping("detail.bo")
	public ModelAndView selectBoard(int bno, 
									ModelAndView mv) {
		
		// System.out.println(bno);
		// bno 에는 상세조회하고자 하는 해당 게시글 번호가 담겨있음
		
		int result = boardService.increaseCount(bno);
		
		if(result > 0) { 
			
			Board m = boardService.selectBoard(bno);
			
			mv.addObject("m", m)
			  .setViewName("board/gosuRequest/gosuDetail"); 
			
		} else { 
			
			mv.addObject("errorMsg", "게시글 상세조회 실패")
			  .setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	@RequestMapping("delete.bo")
	public String deleteBoard(int bno,
							  String filePath,
							  Model model,
							  HttpSession session) {
		
		// bno 에는 post 방식으로 넘겨받은 글번호가 들어가있음
		
		// 삭제 요청
		int result = boardService.deleteBoard(bno);
		
		if(result > 0) { // 삭제 성공
			// => alert 문구를 담아 게시판 리스트 페이지로 url 재요청
			
			// 기존에 첨부파일이 있었을 경우
			// 서버로부터 해당 첨부파일 삭제하기
			
			// filePath 라는 매개변수에는
			// 기존에 첨부파일이 있었을 경우 수정파일명
			// 기존에 첨부파일이 없었을 경우 "" 이 들어가 있음
			if(!filePath.equals("")) {
				// 기존에 첨부파일이 있었을 경우
				// => 해당 파일을 삭제처리
				
				// 해당 파일이 실제 저장되어있는 경로 알아내기
				String realPath = session.getServletContext()
								.getRealPath(filePath);
				
				new File(realPath).delete();
			}
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			
			return "redirect:/list.bo";
			
		} else { // 삭제 실패
			// => 에러문구를 담아서 에러페이지로 포워딩
			
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			
			return "common/errorPage";
		}
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

	
	@RequestMapping("sendPofolWrite.po")
	public String sendPofolWrite() {
		return "board/portfolio/pofolWrite";
	}
	
	@RequestMapping("pofolWrite.po")
	public void pofolWrite() {
		
	}
	
	@RequestMapping("pofolDetail.po")
	public String pofolDetail() {
		return "board/portfolio/pofolDetail";
	}
	
}