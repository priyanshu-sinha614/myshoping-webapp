package com.priyanshu.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.priyanshu.dao.ItemRepository;
import com.priyanshu.model.Item;

@Service
public class ItemService {

	@Autowired
	private ItemRepository itemRespo;
	
	public List<Item> searchAll(){
		return itemRespo.findAll();
	}
	
	public boolean addItem() {
		
		return true;
	}
	
	
	
	
	public List<Item> searchById(List<Integer> id){
		
		ArrayList<Item> orderPro=new ArrayList<>();
		
		for(int i=0;i<id.size();i++) {
			orderPro.add(itemRespo.searchById(id.get(i)));
		}
		
		
		return orderPro;
	}
}
