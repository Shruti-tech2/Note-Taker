package com.entities;

import java.util.Date;
import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity                   //to make java class an entity
@Table(name="notes")      //to mention table(in mySql) mapped to this entity
public class Note {
	@Id                     //@Id to make "id" property as primary key (same as in table)
	private int id;
	private String title;
	
	//IN CASE OF LONG CONTENT OUR APPLICATION WILL RAISE EXCEPTION BECAUSE HIBERNATE HAVE MENTIONED LESS RANGE TO ENTER CONTENT
	//SO HERE BY USING @COLUMN WE ARE MENTIONING LENGTH FOR CONTENT COLUMN IN TABLE.
	
	@Column(length=1500)
	private String content;
	private Date addedDate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getAddedDate() {
		return addedDate;
	}
	public void setAddedDate(Date addedDate) {
		this.addedDate = addedDate;
	}
	//this constructor will called through servelet .
	public Note(String title, String content, Date addedDate) {
		super();
		this.id = new Random().nextInt(100000);      //this will genarte any random id 
		this.title = title;
		this.content = content;
		this.addedDate = addedDate;
	}
	public Note() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
