package com.springboot.demo.Service;


import com.springboot.demo.Entity.User;

import java.util.List;

public interface UserService {
    public User getUserById(int userId);

    User login(String username, String password, String role);

    int register(User user);

    int userInfoUpdate(User user);

    List<User> getUser();
}
