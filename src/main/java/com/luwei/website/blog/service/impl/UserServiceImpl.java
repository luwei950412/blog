package com.luwei.website.blog.service.impl;

import com.luwei.website.blog.domain.User;
import com.luwei.website.blog.repository.UserRepository;
import com.luwei.website.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    public UserRepository userRepository;

    @Override
    public User findByUsername(String username) {
        User user = userRepository.findByUsername(username);
        return user;
    }

    @Override
    @Transactional
    public User addUser(User user) {
        User user1 = userRepository.save(user);
        return user1;
    }

    @Override
    @Transactional
    public void deleteUser(User user) {
        userRepository.delete(user);
    }

    @Override
    @Transactional
    public User updateUser(User user) {
        User user1 = userRepository.save(user);
        return user1;
    }

    @Override
    public List<User> findAll() {
        List<User> userList = userRepository.findAll();
        return userList;
    }

    @Override
    public User getOne(Long id) {
        User user = userRepository.getOne(id);
        return user;
    }
}
