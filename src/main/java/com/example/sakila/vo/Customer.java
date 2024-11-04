package com.example.sakila.vo;

import lombok.Data;

@Data
public class Customer {
	
	private int customerId; // PK
	private int storeId; // FK → store.store_id
	private String firstName;
	private String lastName;
	private String email;
	private int addressId; // FK → address.address_id 
	private int active;
	private String createDate;
	private String lastUpdate; 
	

}
