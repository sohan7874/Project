package com.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class UpdateServvlet
 */
public class UpdateServvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServvlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try {
	
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int id = Integer.parseInt(request.getParameter("noteID"));
	Session s = FactoryProvider.getfactory().openSession();
	Transaction tr = s.beginTransaction();
	Note note = s.get(Note.class, id);
	note.setTitle(title);
	note.setContent(content);
	note.setAddedDate(new Date());
	
	tr.commit();
	s.close();
	response.sendRedirect("all_notes.jsp");	
 	
} catch (Exception e) {
e.printStackTrace();}
	}

}
