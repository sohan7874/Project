package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class deleteservlet
 */
public class deleteservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public deleteservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	
	int noteid =Integer.parseInt( request.getParameter("note_id").trim());
	
	Session s = FactoryProvider.getfactory().openSession();
	Transaction tr = s.beginTransaction();
	
	Note note =s.get(Note.class, noteid);
	s.delete(note);
	
	tr.commit();
	s.close();
	response.sendRedirect("all_notes.jsp");
	}
	

	

}
