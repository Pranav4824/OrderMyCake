package com.example.demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.entites.Login;
import com.example.demo.entites.Vendor;

@Repository
public interface VendorRepository extends JpaRepository<Vendor, Integer> {
	
	@Query("select v from Vendor v where loginid= :l")
	public Vendor getVendor(Login l);
	
	
	
	
}
