package com.kh.meetgo.common.interceptor;

import com.kh.meetgo.member.model.vo.Member;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    // 1. preHandle (선처리)
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        //매개변수 -request  : 사용자의 요청 내용이 담겨있음
        //		 -response : 응답을 처리할 수 있는 객체
        //		 -handler  :  이 요청을 누가 처리하기로 했는가?


        //리턴값
        // - true  : 요청을 controller로 넘겨주겠다.
        // - false : 요청을 controller로 넘겨주지 않겠다.

        // 요청 도달 전에 로그인이 된 상태인지 검사하는 코드 추가
        Member loginUser = (Member) request.getSession().getAttribute("loginUser");
        if(loginUser !=null) return true;
        else{
            request.getSession().setAttribute("alertMsg", "로그인 후 이용 가능합니다.");
            response.sendRedirect(request.getContextPath());
            return false;
        }
    }
//
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                            ModelAndView modelAndView) throws Exception {
        // 매개변수
        // -request : 사용자의 요청
        // -response : 요청에 대한 응답정보를 담고있음
        // -handelr : 이 요청은 누가 처리하기로 했는가
        // -modelAndView : model(응답데이터) + view(응답페이지) 정보

        System.out.println("postHandle 로 잘 넘어오나?");
        System.out.println("handler = " + handler);
        System.out.println("modelAndView = " + modelAndView);
        System.out.println();
    }

}
