package com.springboot.demo.Service.impl;


import com.springboot.demo.Dao.UserMapper;
import com.springboot.demo.Entity.User;
import com.springboot.demo.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User getUserById(int userId) {
        return this.userMapper.selectByPrimaryKey(userId);
    }

    @Override
    public User login(String username, String password, String role) {
        return this.userMapper.selectByUsernameAndPassword(username, password, role);
    }

    @Override
    public int register(User user) {
        return this.userMapper.insert(user);
    }

    @Override
    public int userInfoUpdate(User user) {
        System.out.println("执行servece层userInfoUpdate");
        return this.userMapper.updateByPrimaryKey(user);
    }

    @Override
    public List<User> getUser() {
        return this.userMapper.getUser();
    }

    @Override
    public int getTotalCount(Map<String, String> map) {
        return this.userMapper.getTotalCount(map);
    }

    @Override
    public List<User> getAllUser(Map<String, String> map) {
        return this.userMapper.getAllUser(map);
    }

    @Override
    public void add(User user) {
        this.userMapper.insert(user);
    }

    @Override
    public void delete(int deleteId) {
        this.userMapper.deleteByPrimaryKey(deleteId);
    }
}
