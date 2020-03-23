package com.luwei.website.blog.service;

import com.luwei.website.blog.domain.User;

import java.util.List;

public interface UserService {
    public User findByUsername(String username);

    public User addUser(User user);

    public void deleteUser(User user);

    public User updateUser(User user);

    public List<User> findAll();

    public User getOne(Long id);
}
