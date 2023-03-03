package com.servlets;

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

/**
 * Servlet implementation class Update
 */
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public Update() {
        super();
       
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title =  request.getParameter("title"); //name of input tag from which you want to fetch data 
			String content = request.getParameter("content");
			int id = Integer.parseInt(request.getParameter("noteId").trim());
			//Now create object of Note entity class to store data there
			//Note note = new Note(title,content,new Date());
			
			//System.out.println(note.getId()+"--------"+note.getTitle());
			
			//HERE WE ARE NOT USING ANY DAO class to create and execute sql query 
			//here all queries will be managed by hibernate with help of factory , to add we will use Hibernate:save()
			Session s = FactoryProvider.getFactory().openSession();
	
			//to permanently save note data in table open transaction 
			Transaction tx = s.beginTransaction();
			
			//then update note object and save it.
			Note note = (Note)s.get(Note.class, id);
			
			note.setTitle(title);
			note.setContent(content);
			note.setAddedDate(new Date());
			
			s.save(note);
			//after saving note's object in session commit transaction
			tx.commit();
			s.close();
			
			//to display message on adding data in table
			response.sendRedirect("all_notes.jsp");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
