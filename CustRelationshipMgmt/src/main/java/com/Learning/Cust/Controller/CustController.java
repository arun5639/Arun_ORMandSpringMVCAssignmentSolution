package com.Learning.Cust.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Learning.Cust.DAO.*;
import com.Learning.Cust.Entity.Customer;

@Controller
@RequestMapping("/customer")
public class CustController {
	 
	@Autowired
	private DaoService DaoService;
	
	@RequestMapping("/list")
	public String getWelcome(ModelMap modelMap) {
		List<Customer> cust = DaoService.getallCust();
		modelMap.addAttribute("allcustomer", cust);
		return "list";
	}
	
	@RequestMapping("/addForm")
	public String addForm(ModelMap modelMap, @ModelAttribute ("customer") Customer cust, @ModelAttribute ("String") String rError) {
		
		modelMap.addAttribute("customer", cust);
		if (rError!=null)
			modelMap.addAttribute("Err", rError);
		return "addForm";
	}
		
	@RequestMapping("/save")
	public String save(@ModelAttribute ("customer") Customer thecustomer, ModelMap modelMap, RedirectAttributes ra) {
		String err = "Record already exists";
		String errL = "Fields cannot be blank";
		
		if(thecustomer.getFirstName().isEmpty() || thecustomer.getLastName().isEmpty() || thecustomer.getEmail().isEmpty()) {
			ra.addFlashAttribute("customer", thecustomer);
			ra.addFlashAttribute("String", errL);
			return "redirect:addForm"; 
		}			
		
		if (DaoService.addCust(thecustomer)==true) {
			return "redirect:list"; 
		}
		else {
			ra.addFlashAttribute("customer", thecustomer);
			ra.addFlashAttribute("String", err);
			return "redirect:addForm"; 
		}				
	}		
	
	@RequestMapping("/update")
	public String update(@ModelAttribute ("customer") Customer thecustomer, ModelMap modelMap) {
		DaoService.updateCust(thecustomer); 
		return "redirect:list"; 
	}	 	
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("custId") int customerId, ModelMap modelMap) {
		DaoService.deleteCust(customerId);	
		return "redirect:list"; 
	}
	
	@RequestMapping("/showFormUpdate")
	public String update(@RequestParam("custId") int customerId, ModelMap modelMap) {
		Customer cust = DaoService.getCustomer(customerId);
		modelMap.addAttribute("customer", cust);
		return "update";
	}
}
