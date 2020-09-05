package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entities.Note;
import provider.factoryProvider;


public class saveNote extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Note note = new Note(title, content, new Date());
			
//			System.out.println(note.getId()+" "+note.getTitle());
			
			//saving to database using hibernate
			Session s = factoryProvider.getSessionFactory().openSession();
			
			Transaction tx = s.beginTransaction();
			s.save(note);
			tx.commit();
			
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			out.print("<h1 class= style:'text-align:center'>Note is Added Successfully</h1>");
			out.print("<h1 class= style:'text-align:center'><a href ='all_notes.jsp'>View All</h1>");

			
			s.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
