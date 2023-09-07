package com.icia.member.repository;

import com.icia.member.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public void save(MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO);
        sql.insert("Member.save", memberDTO);
    }
    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
    }

    public List<MemberDTO> findAll() {return sql.selectList("Member.findAll");}

    public MemberDTO findById(Long id) {return sql.selectOne("Member.findById", id);}

    public void delete(Long id) {sql.delete("Member.delete", id);}

    public void update(MemberDTO memberDTO) {sql.update("Member.update", memberDTO);}

        public MemberDTO findByEmail(String memberEmail) {
        return sql.selectOne("Member.findByEmail", memberEmail);
    }
}
