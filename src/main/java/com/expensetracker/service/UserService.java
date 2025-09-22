package com.expensetracker.service;

import com.expensetracker.entity.User;

public interface UserService {

	boolean save(User user);

	boolean login(String un, String pwd);

	User findByUserName(String userName);

}
