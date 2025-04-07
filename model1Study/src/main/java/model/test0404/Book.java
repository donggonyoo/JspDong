package model.test0404;

public class Book { //Bean class , DTO
	
	private String writer;
	private String title;
	private String content;
	
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
		return "이름=" + writer + ", 제목=" + title + ", 내용=" + content;
	}
}
