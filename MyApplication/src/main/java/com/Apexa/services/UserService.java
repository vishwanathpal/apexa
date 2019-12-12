package com.Apexa.services;

import java.util.ArrayList;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.Apexa.model.User;
import com.Apexa.repository.UserRepository;

@Service
@Transactional
public class UserService {

	private UserRepository userRepository;

	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	public void saveMyUser(User user) {
		userRepository.save(user);
	}

	
	public ArrayList<User> showAllUsers()
	{
		ArrayList<User> users = new ArrayList<User>();
		for(User user : userRepository.findAll())
		{
			users.add(user);
		}
		return users;
	}

	public void deleteMyUser(int id) {
		userRepository.deleteById(id);
	}

	public Object editUser(int id) {
		return userRepository.findById(id);
	}

	public User findByUsernameAndPassword(String username, String password) {
		return userRepository.findByUsernameAndPassword(username, password);
	}

}
