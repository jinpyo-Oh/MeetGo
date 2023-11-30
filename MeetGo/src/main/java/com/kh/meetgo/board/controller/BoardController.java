package com.kh.meetgo.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.meetgo.board.model.service.BoardService;
import com.kh.meetgo.board.model.vo.Board;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;

	@RequestMapping("gosuList.go")
	public String test() {
		return "board/gosuRequest/gosuList";
	}
	
	@GetMapping("gosuWrite.go")
	public String enrollForm() {
		return "board/gosuRequest/gosuWrite";
	}
	
	@PostMapping("insert.go")
	public String insertBoard(Board m, 
							  MultipartFile upfile,
							  HttpSession session,
							  Model model) {
		try {
			if(!upfile.getOriginalFilename().equals("")) {
				String changeName = saveFile(upfile, session);
				m.setOriginName(upfile.getOriginalFilename());
				m.setChangeName(changeName);
			}
			
			int result = boardService.insertBoard(m);
			
			if(result > 0) { // 게시글 작성 성공
				// => alert 문구를 담고
				//    list.bo 로 url 재요청
				session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
				return "redirect:/gosuList.go"; // 첫 페이지로 이동
			} else {
				session.setAttribute("alertMsg", "게시글 등록에 실패하였습니다.");
				return "redirect:/gosuWrite.go"; // 등록 페이지로 이동
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("alertMsg", "게시글 등록 중 오류가 발생하였습니다.");
			return "redirect:/gosuWrite.go"; // 등록 페이지로 이동
		}
	}
	
	// saveFile 메소드 구현 필요
	private String saveFile(MultipartFile file, HttpSession session) {
		// 파일 저장 로직을 구현해야 합니다.
		// 저장된 파일의 변경된 이름을 반환하도록 수정하세요.
		return "변경된파일명.jpg"; // 예시로 "변경된파일명.jpg"를 반환하고 있습니다. 실제 구현이 필요합니다.
	}
}