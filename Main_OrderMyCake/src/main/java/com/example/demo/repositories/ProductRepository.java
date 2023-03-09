package com.example.demo.repositories;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.entites.Product;

@Transactional
@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

	
	@Modifying
	@Query("update Product set image = :file where productid = :id")
	public int uploadPhoto(int id , byte [] file);
	
	@Query("select p from Product p where vendorid.id= :id")
	public List<Product> getProductsByVendor(int id);
	
	@Query("select p from Product p where flavorid.id= :id")
	public List<Product> getProductsbyFlavor(int id);

	
	
	
}
