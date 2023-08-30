package learn.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import learn.cart.entities.UserDetails;
import learn.helper.FactoryProvider;

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		String phone=request.getParameter("phone");
		String add=request.getParameter("add");
		PrintWriter pw=response.getWriter();
		
		
		 UserDetails user=new UserDetails(username, email, pass, phone, "default", add,"normal");
		 Session hs= FactoryProvider.getFactory().openSession();
		 Transaction tx= hs.beginTransaction();
		  int id=(int) hs.save(user);
		  
		  
		 HttpSession htses=request.getSession();
		 htses.setAttribute("message", "registration Successfull"+id);
		 response.sendRedirect("login.jsp");
		 
		 
		 tx.commit();
		 hs.close();
		 
	}

}
