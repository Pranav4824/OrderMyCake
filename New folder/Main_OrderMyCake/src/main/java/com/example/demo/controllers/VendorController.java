package com.example.demo.controllers;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entites.Area;

import com.example.demo.entites.Login;
import com.example.demo.entites.Question;
import com.example.demo.entites.Role;
import com.example.demo.entites.Vendor;
import com.example.demo.entites.VendorReg;
import com.example.demo.services.AreaService;

import com.example.demo.services.LoginService;
import com.example.demo.services.QuestionService;
import com.example.demo.services.RoleService;
import com.example.demo.services.VendorService;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
public class VendorController {
	@Autowired
	VendorService vservice;
	
	@Autowired
	LoginService lservice;
	
	@Autowired
	RoleService rservice;
	
	@Autowired
	QuestionService qservice;
	
	@Autowired
	AreaService aservice;
	
	

	
	
	@GetMapping("/getVendor")
	public Vendor getVendor(@RequestParam("loginid") int vloginid ) {
		Login l = lservice.getbyId(vloginid);
		return vservice.getVendor(l);	
	}
	
	@GetMapping("/getAllVendor")
	public List<Vendor> getAllVendor()
	{
		
		return vservice.getAllVendor();
		
	}
	
	
	@PostMapping("/regVendor")
	public Vendor regVendor(@RequestBody VendorReg v)
	{
		System.out.println(v);
		Role r = rservice.getRole(2);
		Question q = qservice.getQue(v.getSecurityid());
		
		
		Login l = new Login(v.getEmail(),v.getPassword(),v.getAns(),q,r,true);
		Login saved = lservice.Save(l);
		
	    Area a = aservice.getArea(v.getAreaid()) ;
	    
		Vendor vn = new Vendor(v.getShopname(),v.getLicence_no(),v.getContactno(),false,v.getAddressline(),a,saved);
		return vservice.Save(vn);
				
				
	}
}
