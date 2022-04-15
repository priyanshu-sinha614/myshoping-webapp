package com.priyanshu.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.priyanshu.dao.UserRepository;
import com.priyanshu.model.User;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepo;
	
	public boolean addUser(User user) {
		
		boolean status=false;
		List<User> userList = userRepo.findByusername(user.getUsername());
		
		if(userList.isEmpty()) {
			User u=userRepo.save(user);
			status=true;
		}
		else {
			status=false;
		}
		
		return status;
	}
	
	public List<User> search(String username) {
		List<User> list = userRepo.findByusername(username);
		
		return list;
	}
	
	public User checkUserOrPass(String username,String password ) {
		User u=null;
		
		User user=userRepo.usernameAndPassword(username, password);
		if(user==null) {
			u=null;
		}
		else {
			u=user;
		}
		
		return u;
	}
	
	// Forget password valid
	public User forgetPasswordCheck(String username,String mobile) {
		return userRepo.checkUsernameAndMobile(username, mobile);
	}
	
	public void update(User user) {
		userRepo.save(user);
		
	}
	
}
