package learn.dao;



import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import learn.cart.entities.Category;

public class CategoryDoa {
	private SessionFactory factory;
	
	

	public CategoryDoa(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	public int saveCategory(Category cat) {
	
		Session session=this.factory.openSession();
		Transaction  tx=session.beginTransaction();
		int catId=(int)session.save(cat);
		tx.commit();
		
		
		
		
		session.close();
		return catId;
	}
	
	public List<Category> getCategory()
	{
		Session s=this.factory.openSession();
		Query query=s.createQuery("from Category");
		List<Category> list= query.list();
		
		
		return list;
		
	}

	

	 public  Category getCategoryById(int catId) {
		 
		 Session session=this.factory.openSession();
		 Category cat= session.get(Category.class, catId );
		 
		 session.close();
		 
		 return cat;
	}
	
	
	
	
}
