package com.example.demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entites.Login;
import com.example.demo.services.LoginService;

@CrossOrigin(origins="http://localhost:3000")
@RestController
public class LoginController {
	@Autowired
	LoginService lservice;
	
	@PostMapping("/chkLogin")
	public Login chkLogin(@RequestBody Login lcheck) throws Exception
	{
		if(lcheck.getEmail().equals(""))
		throw new Exception();
		return lservice.getLogin(lcheck.getEmail(), lcheck.getPassword());
	}
	

}
