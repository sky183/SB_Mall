package com.sb.mall.home.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.sb.mall.member.model.MemberInfo;
import com.sb.mall.member.service.AES256Util;
import com.sb.mall.member.service.MemberJoinService;
import com.sb.mall.member.service.MemberMailService;
import com.sb.mall.member.service.Sha256;

@Controller 

//joinSession추가
@RequestMapping("member/join") // 요청에 대해 어떤 Controller, 어떤 메소드가 처리할지를 맵핑하기 위한 어노테이션
@SessionAttributes("memberInfo")
public class JoinController {
	
	@Autowired
	private MemberJoinService joinService;
	
	@Autowired
	private MemberMailService noti;
	
	/*암호화 관련 의존주입 2018.11.16*/
	@Autowired
	private Sha256 sha256;
	
	/*암호화 관련 의존주입 2018.11.16*/
	@Autowired
	private AES256Util aES256Util;
	
		
	@RequestMapping(method = RequestMethod.GET) 
	public String getJoinForm() {
		System.out.println("HOME 에서 JOIN 클릭");
		
		return "view/joinForm";
	}
	
	/*주소API POPUP화면*/
	@RequestMapping("/popup/jusoPopup")
	public String addressAIP() {
		System.out.println("실행");
		
		return "/popup/jusoPopup";
	}
	
	//가입시 입력한 정보를 POST방식으로 받아옴
	@RequestMapping(method = RequestMethod.POST)  
	public ModelAndView getResultForm(
			MemberInfo memberInfo, 
			@RequestParam("userPwChck") String userPwChck, //비밀번호 재 확인할 변수
			HttpServletRequest request, 
			HttpSession session
			) {
		
		//모델 뷰 생성
		ModelAndView modelAndView = new ModelAndView();
		
		//리턴할 경로 저장
		modelAndView.setViewName("/home");
		
		/*2018.11.15 메일 보내기용 userid(가입시 입력된 Email)*/
		String userId = memberInfo.getUserId();
		String userName = memberInfo.getUserName();
		String filePath = "/member/memberWelcome.jsp";
		
		//비밀번호 재 확인
		if (!memberInfo.getUserPw().equals(userPwChck)) {
			modelAndView.setViewName("error/joinError");
			modelAndView.addObject("error", "비밀번호가 다릅니다.");
			return modelAndView;
		}
		
		/*2018.11.16 암호화 패치*/
		System.out.println("The Password you inputed :" + memberInfo.getUserPw());
		String encryptionPW = sha256.encrypt(memberInfo.getUserPw());
		System.out.println("be encryption password :" + encryptionPW);
		memberInfo.setUserPw(encryptionPW);
		
		
		
		try {
			
			//joinSession에 memberInfo등록
			int resultCnt = joinService.joinResult(memberInfo, request);
			modelAndView.addObject("memberInfo", memberInfo);
			
			//1. Session(memberInfo) is not null 일때 회원가입
			if (memberInfo != null) {
				
				System.out.println("1. Session is not null");
				System.out.println("<Controller Message>");
				System.out.println("가입한 회원 ID:" + memberInfo.getUserId());
				//1.1 회원가입 실패시 : resultCnt == 0 
				if(resultCnt==0) {
					System.out.println("1.1 회원가입 실패");
					
					modelAndView.setViewName("error/memberjoinError");
				
				}else {
					System.out.println("1.2 회원가입 성공");
					System.out.println("-RequestMethod.POST방식 가입완료");
					
					noti.sendMail(userId, userName, filePath ,session);
					System.out.println("-메일보내기 완료");
					
					modelAndView.setViewName("view/home");
				}
				
			}else {
				System.out.println("2.ID has already been taken.");
				modelAndView.setViewName("view/home");
			}
			
		} catch (SQLException e) {
			modelAndView.setViewName("join/joinFail");
			modelAndView.addObject("error", "이미 존재하는 아이디입니다.");
			System.out.println("SQLExceptione");
		} catch (IllegalStateException e) {
			modelAndView.setViewName("join/joinFail");
			modelAndView.addObject("error", "이미 존재하는 아이디입니다.");
			System.out.println("IllegalStateException");
		} catch (IOException e) {
			modelAndView.setViewName("join/joinFail");
			modelAndView.addObject("error", "이미 존재하는 아이디입니다.");
			System.out.println("IOException");
		}catch (Exception e) {
			modelAndView.setViewName("join/joinFail");
			System.out.println("Exception");
			modelAndView.addObject("error", "이미 존재하는 아이디입니다.");
		}
		
		return modelAndView;
		
	}// end of method (getResultForm)
}// end of class (JoinController)

