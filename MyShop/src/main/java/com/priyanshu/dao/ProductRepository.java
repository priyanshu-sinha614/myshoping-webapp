package com.priyanshu.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.priyanshu.model.ProductOrder;

@Repository
public interface ProductRepository extends JpaRepository<ProductOrder, Integer> {

	@Query(value = "select * from product_order where username=?1" ,nativeQuery = true)
	public List<ProductOrder> fetchAllDataByUsername(String username);
}
