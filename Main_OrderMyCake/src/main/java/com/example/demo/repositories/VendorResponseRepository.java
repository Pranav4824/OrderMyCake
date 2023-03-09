package com.example.demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entites.VendorResponse;

@Repository
public interface VendorResponseRepository extends JpaRepository<VendorResponse, Integer> {
	
	

}
