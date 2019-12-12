package com.Apexa.repository;



import org.springframework.data.repository.CrudRepository;

import com.Apexa.model.User;

public interface UserRepository extends CrudRepository<User, Integer> 
{

	User findByUsernameAndPassword(String username, String password);
	
}
