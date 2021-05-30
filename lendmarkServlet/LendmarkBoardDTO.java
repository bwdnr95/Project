package lendmarkServlet;

public class LendmarkBoardDTO {
	private String idx;
	private String id;
	 private String title;
	 private String content;
	 private String price;
	 private java.sql.Date postdate;
	 private String oimg;
	 private String simg;
	 private String heartcount;
	 private String visitcount;
	 private String category;
	 private String chattime;
	 private String heart;
	 
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getChattime() {
		return chattime;
	}
	public void setChattime(String chattime) {
		this.chattime = chattime;
	}
	public String getHeart() {
		return heart;
	}
	public void setHeart(String heart) {
		this.heart = heart;
	}
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
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
	public java.sql.Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
	public String getOimg() {
		return oimg;
	}
	public void setOimg(String oimg) {
		this.oimg = oimg;
	}
	public String getSimg() {
		return simg;
	}
	public void setSimg(String simg) {
		this.simg = simg;
	}
	public String getHeartcount() {
		return heartcount;
	}
	public void setHeartcount(String heartcount) {
		this.heartcount = heartcount;
	}
	public String getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}

}
