package com.Apexa.controller;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Apexa.model.User;
import com.Apexa.services.UserService;

@Controller
public class ApplicationController
{
		
	@Autowired
	private UserService userService;
	
	@RequestMapping("/welcome")
	public String Welcome(HttpServletRequest request)
	{
		request.setAttribute("mode","MODE-HOME");
		return "welcomepage";
	}
	
	@RequestMapping("/register")
	public String Registration(HttpServletRequest request)
	{
		request.setAttribute("mode","MODE-REGISTER");
		return "welcomepage";
	}
	
	@PostMapping("/saveUser")
	public String registerUser(@ModelAttribute User user, BindingResult bindingResult, HttpServletRequest request)
	{
		userService.saveMyUser(user);
		request.setAttribute("mode","MODE-HOME");
		return "welcomepage";
	}
	
	@GetMapping("/show-users")
	public String showAllUsers(HttpServletRequest request) {
		request.setAttribute("users", userService.showAllUsers());
		request.setAttribute("mode", "ALL-USERS");
		System.out.println("Employee records::::::"+userService.showAllUsers());
		return "welcomepage";
	}
	
	@RequestMapping("/delete-user")
	public String deleteUser(@RequestParam int id, HttpServletRequest request) 
	{
		userService.deleteMyUser(id);
		request.setAttribute("users", userService.showAllUsers());
		request.setAttribute("mode", "ALL-USERS");
		return "welcomepage";
	}
	
	@RequestMapping("/edit-user")
	public String editUser(@RequestParam int id,HttpServletRequest request) 
	{
		request.setAttribute("users", userService.editUser(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "welcomepage";
	}

	@RequestMapping("/login")
	public String login(HttpServletRequest request) 
	{
		request.setAttribute("mode", "MODE_LOGIN");
		return "welcomepage";
	}
	
	@RequestMapping ("/login-user")
	public String loginUser(@ModelAttribute User user, HttpServletRequest request)
	{
		if(userService.findByUsernameAndPassword(user.getUsername(), user.getPassword())!=null)
		{
			return "homepage";
		}
		else
		{
			request.setAttribute("error", "Invalid Username or Password");
			request.setAttribute("mode", "MODE_LOGIN");
			return "welcomepage";

		}
	}

}
