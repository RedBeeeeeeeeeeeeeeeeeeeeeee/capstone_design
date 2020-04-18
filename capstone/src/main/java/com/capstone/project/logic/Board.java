package com.capstone.project.logic;

import java.util.Date;

public class Board { 

private int id; 
private String subject; 
private String context; 
private String attachments; 
private int likes; 
private int views; 
private Date create_time; 
private Date update_time;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public String getContext() {
	return context;
}
public void setContext(String context) {
	this.context = context;
}
public String getAttachments() {
	return attachments;
}
public void setAttachments(String attachments) {
	this.attachments = attachments;
}
public int getLikes() {
	return likes;
}
public void setLikes(int likes) {
	this.likes = likes;
}
public int getViews() {
	return views;
}
public void setViews(int views) {
	this.views = views;
}
public Date getCreate_time() {
	return create_time;
}
public void setCreate_time(Date create_time) {
	this.create_time = create_time;
}
public Date getUpdate_time() {
	return update_time;
}
public void setUpdate_time(Date update_time) {
	this.update_time = update_time;
}
@Override
public String toString() {
	return "Board [id=" + id + "\nsubject=" + subject + "\ncontext=" + context + "\nattachments=" + attachments
			+ "\nlikes=" + likes + "\nviews=" + views + "\ncreate_time=" + create_time + "\nupdate_time=" + update_time
			+ "\ngetId()=" + getId() + "\ngetSubject()=" + getSubject() + "\ngetContext()=" + getContext()
			+ "\ngetAttachments()=" + getAttachments() + "\ngetLikes()=" + getLikes() + "\ngetViews()=" + getViews()
			+ "\ngetCreate_time()=" + getCreate_time() + "\ngetUpdate_time()=" + getUpdate_time() + "\ngetClass()="
			+ getClass() + "\nhashCode()=" + hashCode() + "\ntoString()=" + super.toString() + "]";
}

//get and set ...

}