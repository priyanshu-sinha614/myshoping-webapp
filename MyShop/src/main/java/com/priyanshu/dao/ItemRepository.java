package com.priyanshu.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.priyanshu.model.Item;


@Repository
public interface ItemRepository extends JpaRepository<Item, Integer> {

	@Query(value = "select * from item where product_id=?1",nativeQuery =true )
	public Item searchById(int id);
}
