package com.luwei.website.blog.service.impl;

import com.luwei.website.blog.domain.Notice;
import com.luwei.website.blog.repository.NoticeRepository;
import com.luwei.website.blog.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    public NoticeRepository noticeRepository;

    @Override
    public Notice addNotice(Notice notice) {
        Notice notice1 = noticeRepository.save(notice);
        return notice1;
    }

    @Override
    public void deleteNotice(Long id) {
        noticeRepository.delete(id);
    }

    @Override
    public Notice updateNotice(Notice notice) {
        Notice notice1 = noticeRepository.save(notice);
        return notice1;
    }

    @Override
    public Notice getOne(Long id) {
        Notice notice = noticeRepository.getOne(id);
        return notice;
    }

    @Override
    public List<Notice> findByStatus(Integer status) {
        List<Notice> noticeList = noticeRepository.findByStatus(status);
        return noticeList;
    }

    @Override
    public List<Notice> findAll() {
        List<Notice> noticeList = noticeRepository.findAll();
        return noticeList;
    }
}
