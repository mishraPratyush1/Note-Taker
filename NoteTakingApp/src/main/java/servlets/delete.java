package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import entities.Note;
import provider.factoryProvider;

public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try {
			int id = Integer.parseInt(request.getParameter("id").trim());
			Session s= factoryProvider.getSessionFactory().openSession();
			Transaction tx = s.beginTransaction();
			Note note = s.get(Note.class, id);
			s.delete(note);
			tx.commit();
			s.close();
			response.sendRedirect("all_notes.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
