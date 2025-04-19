package model.book;

import java.util.Date;

public class Book {

	private String writer;
	private String title;
	private String content;
	private Date dt;
	
	
	
	public Date getDt() {
		return dt;
	}
	public void setDt(Date dt) {
		this.dt = dt;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	@Override
	public String toString() {
		return "Book [writer=" + writer + ", title=" + title + ", content=" + content + ", dt=" + dt + "]";
	}

	
	
	
}
