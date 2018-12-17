package com.springboot.demo.Service.impl;


import com.springboot.demo.Dao.UserMapper;
import com.springboot.demo.Entity.User;
import com.springboot.demo.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public int register(String username, String password, String role) {
        User user = new User(username,password,role);
        return this.userMapper.insert(user);
    }
}
