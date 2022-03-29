package com.Learning.Cust.Persistance;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.Learning.Cust.DAO.DaoService;
import com.Learning.Cust.Entity.Customer;

@Repository
public class DAOServiceImpl implements DaoService {
	
	@Autowired
	private SessionFactory sessionFactory;
	private Session session;
		
	public DAOServiceImpl(SessionFactory sessionFactory) {

		this.sessionFactory = sessionFactory;

		try {
			session=(this.sessionFactory.getCurrentSession());
		} catch (HibernateException ex) {
			session=(this.sessionFactory.openSession());
		}
	}

	@Override
	public boolean addCust(Customer cust) {
		
		Query<Customer> query = session.createQuery("from Customer where firstName=:fName and lastName=:lName and email=:em", Customer.class);
		query.setParameter("fName", cust.getFirstName());
		query.setParameter("lName", cust.getLastName());
		query.setParameter("em", cust.getEmail());
		
		List<Customer> results = query.getResultList();
		
		if(!results.isEmpty()) {
			return false;
		}
		else {			
			Transaction tx = session.beginTransaction();
			session.save(cust);
			tx.commit();
			return true;
		}
	}

	@Override
	public List<Customer> getallCust() {
		
		Query<Customer> query = session.createQuery("from Customer", Customer.class);
		List<Customer> allCustomer = query.getResultList();
		return allCustomer;
	}

	@Override
	public void updateCust(Customer cust) {
		
		Transaction txn = session.beginTransaction();
		session.merge(cust);
		txn.commit();
	}
	
	@Override
	public Customer getCustomer(int custid) {
		Transaction txn = session.beginTransaction();
		Customer cust = session.get(Customer.class, custid);
		txn.commit();
		return cust;
	}

	@Override
	public void deleteCust(int custid) {
		
		Transaction txn = session.beginTransaction();
		Customer cust = session.get(Customer.class, custid);
		session.delete(cust);
		txn.commit();
	}

	public Session getSession() {
		return session;
	}

	public void setSession(Session session) {
		this.session = session;
	}
}
