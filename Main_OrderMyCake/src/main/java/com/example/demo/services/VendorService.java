package com.example.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entites.Login;
import com.example.demo.entites.Vendor;
import com.example.demo.repositories.LoginRepository;
import com.example.demo.repositories.VendorRepository;

@Service
public class VendorService {
	
	@Autowired
	VendorRepository vrepo;
	
	@Autowired
	LoginRepository lrepo;
	
	public Vendor getVendor(Login l) {
		return vrepo.getVendor(l);
	}
	
	public Vendor Save (Vendor v)
	{
		return vrepo.save(v);
	}

}
