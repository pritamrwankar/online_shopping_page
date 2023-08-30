package learn.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import jakarta.persistence.Query;
import learn.cart.entities.UserDetails;

public class UserDoa {
	private SessionFactory factory;

	public UserDoa(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	 public UserDetails getUserByEmailAndPassword(String email,String passWord) 
	 {
		 UserDetails  user=null;
		 try {
			 
			 String query="from UserDetails where userEmail =:e and userPassword =:p";
			 Session session=this.factory.openSession();
			 Query q=session.createQuery(query);
			 q.setParameter("e", email);
			 q.setParameter("p", passWord);
			  user =(UserDetails)((org.hibernate.query.Query) q).uniqueResult();
			 
			 
			 session.close();
			 
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		 
		 
		 
		 
		 return  user;
	 }
     // get products
}
