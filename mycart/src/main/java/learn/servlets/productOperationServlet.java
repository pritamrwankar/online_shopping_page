package learn.servlets;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import learn.cart.entities.Category;
import learn.cart.entities.Products;
import learn.dao.CategoryDoa;
import learn.dao.ProductDao;
import learn.helper.FactoryProvider;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

/**
 * Servlet implementation class productOperationServlet
 */
@MultipartConfig
public class productOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		 PrintWriter pw= response.getWriter();
		
		String op=request.getParameter("opration");
		if(op.trim().equals("addCategories"))
		{
			String catdet=request.getParameter("catdet");
			String catdes=request.getParameter("catdes");
			
			Category categories=new Category();
			categories.setCategorytitle(catdet);
			categories.setCategoryDesc(catdes);
			
			CategoryDoa catdao=new CategoryDoa(FactoryProvider.getFactory());
			int catId=catdao.saveCategory(categories);
			HttpSession https=request.getSession();
			https.setAttribute("message", "Category Added Successfully : "+catId);
			response.sendRedirect("Admin.jsp");
			return;
			
			
		}else if(op.trim().equals("addProduct")) 
		{
			String pname=request.getParameter("pname");
			String pdics=request.getParameter("pdics");
			
			int pprice=Integer.parseInt(request.getParameter("pprice"));
			int pdiscount=Integer.parseInt(request.getParameter("pdiscount"));
			int pquentity=Integer.parseInt(request.getParameter("pquentity"));
			int catId=Integer.parseInt(request.getParameter("catId"));
			Part part=request.getPart("pimg");
			
			
			Products p=new Products();
			p.setpName(pname);
			p.setpDiscrip(pdics);
			p.setpPrice(pprice);
			p.setpDiscount(pdiscount);
			p.setPQuntity(pquentity);
			p.setpPic(part.getSubmittedFileName());
			
			
			CategoryDoa cdao=new CategoryDoa(FactoryProvider.getFactory());
			Category cat=cdao.getCategoryById(catId);
			p.setCategory(cat);
			
			ProductDao dao=new ProductDao(FactoryProvider.getFactory());
		    dao.saveProduct(p);
			
			
			
			String path=request.getRealPath("images")+File.separator+"Products"+File.separator+part.getSubmittedFileName();
			System.out.println(path);
			
				//file upoading code
			
			FileOutputStream fos=new FileOutputStream(path);
			
			InputStream is=part.getInputStream();
			byte []data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			
			 HttpSession htses=request.getSession();
			 htses.setAttribute("message", "product added to database Successfull");
			 response.sendRedirect("Admin.jsp");
			
			
			
			
			
		}
		
		
		
		
		
		
		
		
		
	}

	private FileOutputStream FileOutputStream(Object object) {
		// TODO Auto-generated method stub
		return null;
	}

}
