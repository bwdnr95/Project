package lendmarkServlet;

public class LendmarkBoardDTO {
	private String idx;
	private String id;
	 private String title;
	 private String content;
	 private String sImg;
	 private String price;
	 private String postdate;
	 private String visitcount;
	 private String category;
	 private String chattime;
	 private String heart;
	 private String sellAvailable;
	 private String bargainAvailable;
	 private String minimumPeriod;
	 private String maximumPeriod;
	public String getSellAvailable() {
		return sellAvailable;
	}
	public void setSellAvailable(String sellAvailable) {
		this.sellAvailable = sellAvailable;
	}
	public String getBargainAvailable() {
		return bargainAvailable;
	}
	public void setBargainAvailable(String bargainAvailable) {
		this.bargainAvailable = bargainAvailable;
	}
	public String getMinimumPeriod() {
		return minimumPeriod;
	}
	public void setMinimumPeriod(String minimumPeriod) {
		this.minimumPeriod = minimumPeriod;
	}
	public String getMaximumPeriod() {
		return maximumPeriod;
	}
	public void setMaximumPeriod(String maximumPeriod) {
		this.maximumPeriod = maximumPeriod;
	}
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
	public String getsImg() {
		return sImg;
	}
	public void setsImg(String sImg) {
		this.sImg = sImg;
	}
	public String getPostdate() {
		return postdate;
	}
	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}
	public String getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}

}
