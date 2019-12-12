package com.Apexa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.Apexa.model.User;
import com.Apexa.services.UserService;

@org.springframework.web.bind.annotation.RestController
public class RestController 
{
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/")
	public String Hello()
	{
		return"Hello ";
	}
	
	@GetMapping("/save-user")
	@RequestMapping(method = RequestMethod.POST)
	public String saveUser(@RequestParam String username,@RequestParam String firstname,@RequestParam String lastname,@RequestParam String password)
	{
		
		User user = new User(username,firstname,lastname,password);
		userService.saveMyUser(user);
		return"User saved.";
	}
}
