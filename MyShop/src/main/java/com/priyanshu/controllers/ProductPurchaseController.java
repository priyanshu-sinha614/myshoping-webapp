package com.priyanshu.controllers;

import java.lang.reflect.Array;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
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

import com.priyanshu.dao.ProductRepository;
import com.priyanshu.model.Item;
import com.priyanshu.model.ProductOrder;
import com.priyanshu.model.User;
import com.priyanshu.services.ItemService;

@Controller
@SessionAttributes({ "totalProductList" })
public class ProductPurchaseController {

	public ArrayList<Item> sessionProduct = new ArrayList<>();

	@Autowired
	public HttpSession session;

	@Autowired
	private ItemService itemService;

	@Autowired
	private ProductRepository productRepository;

	@RequestMapping("showCart")
	public String showCart() {
		return "buynow";
	}

	@RequestMapping("/purchase/buynow")
	public String buynow(@ModelAttribute Item item, Model model) {

		User user = (User) session.getAttribute("users");
		String status = "";

		if (user != null) {
			sessionProduct.add(item);
			model.addAttribute("totalProductList", sessionProduct);

			status = "buynow";
		} else
			status = "redirect:/login";

		return status;
	}

	@RequestMapping("/addsessionproduct")
	public String addsessionproduct(@ModelAttribute Item item, Model model) {

		User user = (User) session.getAttribute("users");

		if (user != null) {
			sessionProduct.add(item);
			model.addAttribute("totalProductList", sessionProduct);
			return "redirect:/home";
		} else
			return "redirect:/login";

	}

	@RequestMapping("/removeCart")
	public String removeCart(@RequestParam("id") String pId, Model model) {

		sessionProduct = (ArrayList<Item>) sessionProduct.stream().filter((id) -> {
			return id.getProductId() != Integer.parseInt(pId);

		}).collect(Collectors.toList());
		model.addAttribute("totalProductList", sessionProduct);

		return "buynow";
	}

	@RequestMapping(value = "/purchase/buynow/purchasepage", method = RequestMethod.POST)
	public String purchasePage(HttpServletRequest request, HttpSession session, Model model) {

		ArrayList<Integer> al = new ArrayList<>();
		Enumeration<String> ids = request.getParameterNames();

		int total = Integer.parseInt(request.getParameter("total"));

		if (total > 0) {

			while (ids.hasMoreElements()) {
				String name = ids.nextElement();

				if (!name.equalsIgnoreCase("total")) {
					String data = request.getParameter(name);
					int id = Integer.parseInt(data);
					al.add(id);
				}
			}

			List<Item> items = itemService.searchById(al); // all id present
			User user = (User) session.getAttribute("users");

			ArrayList<ProductOrder> productOrders = new ArrayList<>();
			for (int i = 0; i < items.size(); i++) {
				Item item = items.get(i);
				int price = item.getPrice() + item.getPrice() * 18 / 100;
				ProductOrder productOrder = new ProductOrder(item.getProductId(), user.getFname(), user.getLname(),
						LocalDate.now().toString(), item.getModel(), item.getPath(), item.getDesc(), price,
						user.getUsername());

				productOrders.add(productOrder);
			}
			model.addAttribute("status", "Purchase Successfully");
			productRepository.saveAll(productOrders);

		} else {
			model.addAttribute("status", " NO Select Product");
		}
		sessionProduct.clear();

		return "purchasepage";
	}

	@RequestMapping("/purchase/mypurchase")
	public String myPurchase(Model model, HttpSession session) {

		User user = (User) session.getAttribute("users");

		if (user != null) {
			ArrayList<ProductOrder> myProductOrders = (ArrayList<ProductOrder>) productRepository
					.fetchAllDataByUsername(user.getUsername());
			Collections.reverse(myProductOrders);
			model.addAttribute("myProductOrder", myProductOrders);

			model.addAttribute("names", user.getFname() + " " + user.getLname());
		}

		return "mypurchaseproduct";
	}

}
