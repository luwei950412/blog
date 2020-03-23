package com.luwei.website.blog.service;

import com.luwei.website.blog.domain.Notice;
import org.aspectj.weaver.ast.Not;
import org.springframework.stereotype.Service;

import java.util.List;

public interface NoticeService {

    public Notice addNotice(Notice notice);

    public void deleteNotice(Long id);

    public Notice updateNotice(Notice notice);

    public Notice getOne(Long id);

    public List<Notice> findByStatus(Integer status);

    public List<Notice> findAll();

}
