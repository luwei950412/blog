package com.luwei.website.blog.repository;

import com.luwei.website.blog.domain.Notice;
import org.aspectj.weaver.ast.Not;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface NoticeRepository extends JpaRepository<Notice,Long> {

    List<Notice> findByStatus(Integer status);
}
