package com.springboot.demo.Service;


import com.springboot.demo.Entity.User;

public interface UserService {
    public User getUserById(int userId);

    User login(String username, String password, String role);

    int register(User user);

    int userInfoUpdate(User user);


}
