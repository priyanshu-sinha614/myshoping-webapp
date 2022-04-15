package com.priyanshu.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.priyanshu.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

	public List<User> findByusername(String user);
	
	@Query("select u from User u where u.username = ?1 and u.password = ?2")
	public User usernameAndPassword(String user,String pass);
	
	@Query(value = "select * from user where username=?1 and mobile=?2" ,nativeQuery = true)
	public User checkUsernameAndMobile(String username,String mobile);
	
	
}
