package com.icia.member.controller;

import com.icia.member.dto.MemberDTO;
import com.icia.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String save() {
        return "memberSave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO);
        memberService.save(memberDTO);
        return "memberLogin";
    }

    @GetMapping("/login")
    public String login() {
        return "memberLogin";
    }

    @PostMapping("/login")
    //dto로 받아왔다하더라도 dto안에 값은 이메일과 패스워드만 있는 상태이다.
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session, Model model) {
        MemberDTO memberDTO1 = memberService.login(memberDTO);
        if (memberDTO1 != null) {
            System.out.println("로그인성공");
            //로그인 성공시 사용자의 이메일을 세션에 저장 세션은 남발하지 말자
            session.setAttribute("loginEmail", memberDTO.getMemberEmail());
            //모델에 이메일 저장
            model.addAttribute("member", memberDTO1);
            return "memberMain";
        } else {
            System.out.println("로그인실패");
            return "memberLogin";
        }
    }

    @GetMapping("/members")
    public String members(Model model) {
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "memberList";
    }

    @GetMapping("/member")
    public String member(@RequestParam("id") Long id, Model model) {
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "memberDetail";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        //아래 방법 중 한가지만 사용
        // 해당 파라미터만 없앨 경우
        session.removeAttribute("loginEmail");
        // 세션 전체를 없앨 경우
//        session.invalidate();
        return "redirect:/";
    }
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id){
        memberService.delete(id);
        return "redirect:/members";
    }
    @GetMapping("/update")
    public String update(@RequestParam("id") Long id, Model model){
        MemberDTO memberDTO= memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "memberUpdate";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO){
        memberService.update(memberDTO);
        return "redirect:/members";
    }
//    @GetMapping("/update")
//    //session으로 받은 이메일 값 활용해서 dto받아오기
//    public String updateForm(HttpSession session, Model model){
//        //세션에 저장된 이메일 꺼내기 오브젝트가 가장크니까 강제형변환해서 넣어줘야함
//        String memberEmail = (String) session.getAttribute("loginEmail");
//        MemberDTO memberDTO= memberService.findByMemberEmail(memberEmail);
//        model.addAttribute("member", memberDTO);
//        return "memberUpdate";
//    }

    @GetMapping("/myPage")
    public String myPage(){
        return "memberMain";
    }

    @PostMapping("/duplicate-check")
    public @ResponseBody String emailCheck(@RequestParam("memberEmail") String memberEmail){
        MemberDTO memberDTO1 = memberService.findByEmail(memberEmail);
        if(memberDTO1 == null){
            return "yes";
        }
        return "no";
    }

    @PostMapping("/detail-member")
    public @ResponseBody MemberDTO detailCheck(@RequestParam("memberEmail") String memberEmail){
        MemberDTO memberDTO = memberService.findByEmail(memberEmail);
        return memberDTO;
    }
}


