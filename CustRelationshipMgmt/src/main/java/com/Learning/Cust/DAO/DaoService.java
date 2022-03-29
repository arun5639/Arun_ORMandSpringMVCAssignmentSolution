 package com.Learning.Cust.DAO;

import java.util.List;

import org.springframework.stereotype.Service;

import com.Learning.Cust.Entity.Customer;

@Service
public interface DaoService {
	
	public boolean addCust(Customer thecust);
	public List<Customer> getallCust();
	public void updateCust(Customer cust);
	public void deleteCust(int custid);	
	public Customer getCustomer(int custid);
}
