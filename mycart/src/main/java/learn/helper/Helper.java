package learn.helper;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class Helper {

	public static String get10Words(String disc)
	{
		 String [] str=disc.split(" ");
		 
		 if(str.length>10)
		 {
			 String res="";
			 for(int i=0;i<=10;i++) {
				 res=res+str[i]+" ";
			 }
			 return res+" ...";
		 }
		 else 
		 {
			return (disc+"..") ;
		 }
		 
	}
	
	public static Map<String,Long> getCounts(SessionFactory factory) {
		
		Session s=factory.openSession();
		String q1="select count(*)from UserDetails";
		String q2="select count(*)from Products";
		
		Query query1=s.createQuery(q1);
		Query query2=s.createQuery(q2);
		Long userCount=(Long) query1.list().get(0);
		Long productCount=(Long) query2.list().get(0);
		
		Map<String,Long> map=new HashMap<>();
		map.put("userCount", userCount);
		map.put("productCount", productCount);
		
		
		s.close();
		
		return map;
	}
}
