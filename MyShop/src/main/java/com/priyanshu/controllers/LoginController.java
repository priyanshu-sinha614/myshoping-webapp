package com.priyanshu.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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
import com.priyanshu.services.email.services.MailService;

@Controller
@SessionAttributes(names = "users")
public class LoginController {

	@Autowired
	private UserService userService;
	@Autowired
	private MailService mailService;

	@RequestMapping(value = "/login-handler", method = RequestMethod.POST)
	public String loginHandler(@RequestParam String username, @RequestParam String password, Model model) {

		List<User> u = userService.search(username); // username exited or not
		if (u.size() > 0) {
			User user = userService.checkUserOrPass(username, password); // check username or password valid or not

			if (user != null) {
				model.addAttribute("users", u.get(0));

				model.addAttribute("signupstatus", "welcome ");
				return "redirect:/home";
			} else {
				model.addAttribute("signupstatus", "Username or Password Incorrect ");
				return "login";
			}

		} else {
			model.addAttribute("signupstatus", "This username not match Please Sign up and Create your Account ");
			return "login";

		}

	}

	private User user;

	@RequestMapping(value = "/signup-handler", method = RequestMethod.POST)
	public String signuphandler(@ModelAttribute User user, Model model) {

		this.user = user;

		List<User> search = userService.search(user.getUsername());

		if (search.isEmpty()) {
			boolean mail_OTP = mailService.mail_OTP(user.getUsername());

			if (mail_OTP) {
				return "otp_veri_page";
				// success
			} else {
				model.addAttribute("signupstatus","This Email is a WRONG please enter correct Email id(USERNAME)");
				return "signup";
				// wrong fail
			}

		} else {
			model.addAttribute("signupstatus", "This Email is already exited please try another Email Address");
			return "signup";
		}

	}

	@RequestMapping(value="/otp/verifyOTP")
	public String verifyOTP(@RequestParam("otp") String otp, HttpSession httpSession, Model model) {
		String attribute = (String) httpSession.getAttribute("OTP");

		if (otp.equals(attribute)) {
			
			boolean status = userService.addUser(user);

			model.addAttribute("signupstatus", "SuccessFull Create your account");
			return "login";

		} else {
			model.addAttribute("OTPstatus", "Incorrect OTP please try again");
			return "otp_veri_page";
		}

	}

	@RequestMapping("/forgetpassword")
	public String forgetPassword() {
		return "forgetpassword";
	}

	@RequestMapping(value = "/password/forgetpasswordhandler", method = RequestMethod.POST)
	public ModelAndView forgetpasswordhandler(@RequestParam("uname") String username,
			@RequestParam("mobile") String mobile) {
		ModelAndView mav = new ModelAndView();

		if (username.isBlank() || mobile.isBlank()) {
			mav.addObject("status", "please fill information");
			mav.setViewName("forgetpassword");
		} else {
			User user = userService.forgetPasswordCheck(username, mobile);

			if (user != null) {
				mav.addObject("user", user);
				mav.setViewName("renewpassword");

			} else {
				mav.addObject("status", "Username or Mobile no. incorrect");
				mav.setViewName("forgetpassword");
			}
		}

		return mav;
	}

	@RequestMapping(value = "/password/renewpassword", method = RequestMethod.POST)
	public String renewPassword(@ModelAttribute User user) {

		if (!user.getPassword().isBlank()) {

			userService.update(user);
			return "redirect:/login";

		} else {
			return "renewpassword";
		}

	}


}
