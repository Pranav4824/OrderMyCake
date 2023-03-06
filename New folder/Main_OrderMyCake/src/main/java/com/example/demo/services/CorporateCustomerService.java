package com.example.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entites.CorporateCustomer;
import com.example.demo.entites.Login;
import com.example.demo.entites.Vendor;
import com.example.demo.repositories.CorporateCustomerrRepository;

@Service
public class CorporateCustomerService {
	
	@Autowired
	CorporateCustomerrRepository ccrepo;
	
	public CorporateCustomer getCorporateCustomer(Login l)
	{
		return ccrepo.getCorporateCustomer(l);
	}

	public CorporateCustomer Save (CorporateCustomer v)
	{
		return ccrepo.save(v);
	}
	
	
}
