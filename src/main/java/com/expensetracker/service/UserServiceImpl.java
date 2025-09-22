package com.expensetracker.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.expensetracker.entity.User;
import com.expensetracker.exception.UserNotFound;
import com.expensetracker.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Override
	public boolean save(User user) {
		Optional<User> opt = userRepository.findByUserName(user.getUserName());
		if (opt.isPresent()) {
			return false;
		}
		userRepository.save(user);
		return true;
	}

	@Override
	public boolean login(String un, String pwd) {
		return userRepository.findByUserNameAndPassword(un, pwd).isPresent();
	}

	@Override
	public User findByUserName(String userName) {
		return userRepository.findByUserName(userName).orElseThrow(() -> new UserNotFound("User Not Registered"));
	}

}
