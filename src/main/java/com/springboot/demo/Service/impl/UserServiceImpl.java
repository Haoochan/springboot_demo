package com.springboot.demo.Service.impl;


import com.springboot.demo.Dao.UserMapper;
import com.springboot.demo.Entity.User;
import com.springboot.demo.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;

    @Override
    public User getUserById(int userId) {
        User user = this.userMapper.selectByPrimaryKey(userId);
        if (user.getCollegeId()==null){
            user.setCollegeId(0);
        }
        if (user.getMajorId()==null){
            user.setMajorId(0);
        }
        return user;
    }

    @Override
    public User login(String username, String password, String role) {
        return userMapper.selectByUsernameAndPassword(username, password, role);
    }

    @Override
    public int register(User user) {
        return this.userMapper.insert(user);
    }

    @Override
    public int userInfoUpdate(User user) {
        return this.userMapper.updateByPrimaryKey(user);
    }

    @Override
    public List<User> getUser(Map<String, String> map) {
        return this.userMapper.getUser(map);
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
