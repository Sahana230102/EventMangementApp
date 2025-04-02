package model;

public class event {
	private String event_id;
	private String event_img;
	private String event_name;
	private String event_cost;
	private String event_details;
	private String event_categories;
	public String getEvent_img() {
		return event_img;
	}
	public void setEvent_img(String event_img) {
		this.event_img = event_img;
	}
	public String getEvent_cost() {
		return event_cost;
	}
	public void setEvent_cost(String event_cost) {
		this.event_cost = event_cost;
	}
	public String getEvent_details() {
		return event_details;
	}
	public void setEvent_details(String event_details) {
		this.event_details = event_details;
	}
	public String getEvent_category() {
		return event_categories;
	}
	public void setEvent_category(String event_categories) {
		this.event_categories = event_categories;
	}
	private String rating;
	private String feedback;
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	private String host_id;
	private String date;
	private String status;
	public String getEvent_id() {
		return event_id;
	}
	public void setEvent_id(String event_id) {
		this.event_id = event_id;
	}
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public String getHost_id() {
		return host_id;
	}
	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	private String client_name;
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	private String loc_name;
	public String getLoc_name() {
		return loc_name;
	}
	public void setLoc_name(String loc_name) {
		this.loc_name = loc_name;
	}
	
}
