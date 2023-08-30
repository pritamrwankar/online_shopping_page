package learn.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import learn.cart.entities.Products;

public class ProductDao {
	private SessionFactory factory;

	public ProductDao (SessionFactory factory) {
		super();
		this.factory = factory;
	}
	public boolean saveProduct(Products p) {
		boolean b=false;
		
		Session s=this.factory.openSession();
		Transaction tx=s.beginTransaction();
		s.save(p);
		tx.commit();
		s.close();
		b=true;
		return b;
	}
	//get Products..
	
	public List<Products> getAllProducts()
	{
		Session s=this.factory.openSession();
		Query q=s.createQuery("from Products");
		List<Products> list= q.list();
		return list;
	}
	//get all products by categoryid
	public List<Products> getAllProductsBycategoryId(int cid)
	{
		Session s=this.factory.openSession();
		Query q=s.createQuery("from Products  as p where p.category.categoryId =:id");
		q.setParameter("id",cid);
		List<Products> list= q.list();
		return list;
	}
	
}
