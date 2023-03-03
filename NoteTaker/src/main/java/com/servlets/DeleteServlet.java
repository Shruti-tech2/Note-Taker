package com.servlets;

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
 * Servlet implementation class DeleteServlet
 */
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public DeleteServlet() {
        super();
    }
    //CALLED WHEN DELETE BUTTON WILL BE CLICKED 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			int noteId = Integer.parseInt(request.getParameter("note_id").trim()); //trim is used so that space will get trimmed 
			
			//get session to perform delete note's row based on id
			Session s = FactoryProvider.getFactory().openSession();
			
			//Transaction is important to make permanent changes in database
			Transaction tx = s.beginTransaction();
			
			//first get note based on noteId from session/database
			Note note = (Note)s.get(Note.class, noteId);
			
			//then delete note object from session.
			s.delete(note);
			
			//then commit transaction is important to save current state of session in database.
			tx.commit();
			
			//then note will be deleted from database and added to removed state in hibernate and when session will be closed
			//it will also removed from session.
			
			s.close();
			
			//redirect to all_notes.jsp with rest notes
			response.sendRedirect("all_notes.jsp");
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
