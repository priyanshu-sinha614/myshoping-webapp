package com.priyanshu.controllers;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.priyanshu.model.Item;
import com.priyanshu.services.ItemService;


@Controller
@SessionAttributes(names = "allitem")
public class HomeController {
	
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private ProductPurchaseController purchase;
	
	private ArrayList<Item> allitem=new ArrayList<>();
	
	
	public HomeController(ItemService item) {
		itemService=item;
		allitem=(ArrayList<Item>) itemService.searchAll();
	}

	
	@ModelAttribute
	public void modelData(Model model) {
		Collections.shuffle(allitem);
		model.addAttribute("allitem", allitem);
	}


	@RequestMapping(value= {"/", "/home" })
	public String home2(Model m) {
		return "home";
	}
	
	@RequestMapping("/laptop")
	public String laptop(Model model) {
		
		List<Item> list=allitem.stream().filter(item->{
			if(item.getModel().contains("Laptop"))
				return true;
			else {
				return false;
			}
		}).collect(Collectors.toList());
		
		model.addAttribute("laptops", list);
		return "laptoppage";
	}
	
	@RequestMapping("/mobile")
	public String mobile(Model model) {
		
		List<Item> list=allitem.stream().filter(item->{
			if(item.getModel().contains("Mobile"))
				return true;
			else {
				return false;
			}
		}).collect(Collectors.toList());
		
		model.addAttribute("mobiles", list);
		return "mobilepage";
	}
	
	
	@RequestMapping("/admin")
	public String admin() {
		return "admin";
	}
	
	@RequestMapping("/login")
	public String login(Model model) {
		return "login";
	}
	
	@RequestMapping("/logout")
	public RedirectView logout(HttpSession session ,Model model) {
		
		purchase.sessionProduct.clear();
		session.invalidate();
		RedirectView rv=new RedirectView();
		rv.setUrl("/home");
		
		return rv;
	}
	
	
	@RequestMapping("/sign-up")
	public String signup() {
		return "signup";
	}
	
	@RequestMapping(value = "/about" ,method = RequestMethod.GET)
	public String about() {
		return "aboutus";
	}
	
}



