package com.multi.tayotayo.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SocialController {
	@Autowired
	MemberService memberservice;

	@Autowired
	SocialService socialservice;

	// 소셜 등록
	@RequestMapping(value = "member/socialinsert", method = RequestMethod.POST)
	public String insert(SocialVO socialVO, Model model, HttpSession session) {
		model.addAttribute("social", socialVO);

		// 아이디 중복검사 true면 insert
		if (socialservice.socialidConfirm(socialVO)) {
			return "member/social_memberid_confirm";
		} else {
			String member_id_confirm = socialservice.member_id_select(socialVO);
			session.setAttribute("소셜_id", member_id_confirm);
			session.setAttribute("type", socialVO.getType());

			System.out.println(member_id_confirm + " 세션저장 " + "로그인 성공");
			System.out.println(socialVO.getType() + " 소셜로그인");

			return "redirect:/mainpage/MainPage.jsp";
		}
	}

	// 소셜 등록
	@RequestMapping(value = "member/social_memberid_update", method = RequestMethod.POST)
	public String social_memberid_update(SocialVO socialVO, String member_id, String pw, HttpSession session) {
		try {
			System.out.println(socialVO);
			System.out.println(member_id);
			System.out.println(pw);

			// 계정연동진행
			// member_id 확인
			MemberVO memberVO = new MemberVO();
			memberVO.setMember_id(member_id);
			memberVO.setPw(pw);

			if (login(memberVO)) {
				System.out.println("<<연동>> 타요타요 아이디가 맞습니다.");
				// 소셜테이블 외래키 Member_id_update
				socialVO.setMember_id(memberVO.getMember_id());
				System.out.println(socialVO);
				socialservice.insert(socialVO);

			} else {
				System.out.println("연동아이디가 틀렸습니다.");
				return "member/login_fail_alert.jsp";
			}

			// 현재 연동된 member로그인 세션 찾기
			String member_id_confirm = socialservice.member_id_select(socialVO);
			session.setAttribute("소셜_id", member_id_confirm);
			session.setAttribute("type", socialVO.getType());

			System.out.println(member_id_confirm + " 세션저장 " + "로그인 성공");
			System.out.println(socialVO.getType() + " 소셜로그인");

			return "redirect:/mainpage/MainPage.jsp";
		} catch (Exception e) {
			System.out.println("sql 실패");
			return "redirect:/member/login.jsp";
		}

	}

	// 계정연동id 확인
	@RequestMapping(value = "member/memberidconfirm", method = RequestMethod.POST)
	public boolean login(MemberVO memberVO) {
		System.out.println(memberVO);

		int result = memberservice.login(memberVO);

		System.out.println(result);
		if (result == 0) { // 연동실패
			return false;
		} else { // 연동id 성공
			return true;
		}

	}

}
