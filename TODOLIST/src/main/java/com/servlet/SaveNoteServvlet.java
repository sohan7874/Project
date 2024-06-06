package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

import jdk.nashorn.internal.runtime.regexp.JoniRegExp.Factory;


public class SaveNoteServvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SaveNoteServvlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	try {
	
		
		
	String title =	request.getParameter("title");
	String content = request.getParameter("content");
		
	Note note = new Note( title, content, new Date());
	
	
        Session s =FactoryProvider.getfactory().openSession();	
        Transaction tr =s.beginTransaction();
s.save(note);

tr.commit();
s.close();


response.setContentType("text/html");
PrintWriter out = response.getWriter() ;
out.print("<h1 style='text-align:center;'>SUCCESSFULLY ADDDED<h1>");
out.print("<h1 style='text-align:center;'> <a href='all_notes.jsp' > VIEW ALLNOTES<h1>");


	} catch (Exception e) {	

	e.printStackTrace();
	
	
	
	}
	
	
	
	
	
	
	
	}

}
