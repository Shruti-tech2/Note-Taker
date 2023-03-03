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
 * Servlet implementation class SaveNoteServlet
 */
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveNoteServlet() {
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
	
	
	//ON ADD NTOTE'S FORM SUBMMISSION THIS METHOD WILL BE CALLED
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//FETCH THE VALUES e.i. title and content
		try {
			String title =  request.getParameter("title"); //name of input tag from which you want to fetch data 
			String content = request.getParameter("content");
			
			//Now create object of Note entity class to store data there
			Note note = new Note(title,content,new Date());
			
			//System.out.println(note.getId()+"--------"+note.getTitle());
			
			//HERE WE ARE NOT USING ANY DAO class to create and execute sql query 
			//here all queries will be managed by hibernate with help of factory , to add we will use Hibernate:save()
			Session s = FactoryProvider.getFactory().openSession();
	
			//to permanently save note data in table open transaction 
			Transaction tx = s.beginTransaction();
			
			//then save note object
			s.save(note);
			
			//after saving note's object in session commit transaction
			tx.commit();
			s.close();
			
			//to display message on adding data in table
			response.setContentType("text/html");   //so that browser resolve this response in html
			PrintWriter out = response.getWriter();
			out.println("<h1 style='text-align:center;'>Note is added successfully !</h1>");
			out.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>View All Notes</a></h1>");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
