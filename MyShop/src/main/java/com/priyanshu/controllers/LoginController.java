package com.priyanshu.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.priyanshu.model.User;
import com.priyanshu.services.UserService;

@Controller
@SessionAttributes(names  ="users")
public class LoginController {
	
	@Autowired
	private UserService userService;

	
	@RequestMapping(value = "/login-handler" ,method = RequestMethod.POST)
	public String loginHandler(@RequestParam String username, @RequestParam String password ,Model model) {
		
		List<User>u=userService.search(username);  // username exited or not
		if(u.size()>0) {
			User user=userService.checkUserOrPass(username, password);  //  check username or password valid or not
			
			if(user!=null) {
				model.addAttribute("users", u.get(0));
				
				model.addAttribute("signupstatus", "welcome ");
				return "redirect:/home";
			}
			else
			{
				model.addAttribute("signupstatus", "Username or Password Incorrect ");
				return "login";
			}
			
		}else {
			model.addAttribute("signupstatus", "This username not match Please Sign up and Create your Account ");
			return "login";
			
		}
		
	}
	
	
	@RequestMapping(value = "/signup-handler" ,method = RequestMethod.POST)
	public String signuphandler(@ModelAttribute User user, Model model) {
		
		boolean status = userService.addUser(user);
		
		if(status) {
			model.addAttribute("signupstatus", "SuccessFull Create your account");
			return "login";
		}
		
		else {
			model.addAttribute("signupstatus", "This Email is already exited please try another Email Address");
			return "signup";
		}
		
	}
	
	@RequestMapping("/forgetpassword")
	public String forgetPassword() {
		return "forgetpassword";
	}
	
	@RequestMapping(value = "/password/forgetpasswordhandler" ,method = RequestMethod.POST)
	public ModelAndView forgetpasswordhandler(@RequestParam("uname") String username, @RequestParam("mobile") String mobile) {
		ModelAndView mav=new ModelAndView();
		
		if(username.isBlank() || mobile.isBlank()) {
			mav.addObject("status", "please fill information");
			mav.setViewName("forgetpassword");
		}
		else {
			User user=userService.forgetPasswordCheck(username, mobile);
			
			if(user!=null) {
				mav.addObject("user", user);
				mav.setViewName("renewpassword");
				
			}else {
				mav.addObject("status", "Username or Mobile no. incorrect");
				mav.setViewName("forgetpassword");
			}
		}
		
		
		return mav;
	}
	
	@RequestMapping(value="/password/renewpassword",method =RequestMethod.POST)
	public String renewPassword(@ModelAttribute User user) {
		
		if(!user.getPassword().isBlank()) {
			
			userService.update(user);
			return "redirect:/login";
			
		}
		else {
			return "renewpassword";
		}
		
	}
	
	
}







