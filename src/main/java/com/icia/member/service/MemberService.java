package com.icia.member.service;

import com.icia.member.dto.MemberDTO;
import com.icia.member.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.print.DocFlavor;
import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;
    public void save(MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO);
        memberRepository.save(memberDTO);
    }
    public MemberDTO login(MemberDTO memberDTO) {
        /*
            1.이메일,비밀번호 두 값 모두 일치하는 db조회결과를 가져옴(조회결과 있으면 로그인 성공)
            2.이메일로 db에서 조회에서 서비스에서 비밀번호를 서로 빅하여 일치하면 로그인 성공
        */
        return memberRepository.login(memberDTO);
    }

    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }

    public MemberDTO findById(Long id) {return memberRepository.findById(id);}

    public void delete(Long id) {memberRepository.delete(id);}

    public void update(MemberDTO memberDTO) {
        memberRepository.update(memberDTO);
    }


    public MemberDTO findByEmail(String memberEmail) {
        return memberRepository.findByEmail(memberEmail);
    }
}
