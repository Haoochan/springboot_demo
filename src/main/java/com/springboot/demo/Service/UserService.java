package com.springboot.demo.Service;


import com.springboot.demo.Entity.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    public User getUserById(int userId);

    User login(String username, String password, String role);

    int register(User user);

    int userInfoUpdate(User user);

    List<User> getUser(Map<String, String> map);

    int getTotalCount(Map<String, String> map);

    List<User> getAllUser(Map<String, String> map);

    void add(User user);

    void delete(int deleteId);
}
