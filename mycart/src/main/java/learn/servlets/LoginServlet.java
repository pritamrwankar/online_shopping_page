package learn.servlets;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import learn.cart.entities.UserDetails;
import learn.dao.UserDoa;
import learn.helper.FactoryProvider;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.jasper.tagplugins.jstl.core.Out;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
	}
    public LoginServlet() {
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
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		PrintWriter pw=response.getWriter();		
		
		
		UserDoa userdoa=new UserDoa(FactoryProvider.getFactory());
		UserDetails user= userdoa.getUserByEmailAndPassword(email, pass);
		System.out.println(user+"");
		HttpSession https=request.getSession();
		pw.println("<html><head></head><body>");
		if(user==null) 
		{
			https.setAttribute("message", "invalide Crediatial");
			response.sendRedirect("login.jsp");
			return;
		}
		else {
			https.setAttribute("current_user",user);
			
			   if(user.getUserType().equals("admin"))
			   {
				   response.sendRedirect("Admin.jsp");
			   }else if(user.getUserType().equals("normal"))
			   {
				   response.sendRedirect("Normal.jsp");
			   }else {
				   pw.println("User not found ");
			   }
		}
		 	
		
		
	}

}
