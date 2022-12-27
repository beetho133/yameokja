package vo;

import java.util.Date;

public class SearchVO {
	
	private String searchArticle;
	private String searchKeywordString;
	private String startDate;
	private String endDate;
	private int searchKeywordInt;
	
	
	public SearchVO() {
		// TODO Auto-generated constructor stub
	}

	public SearchVO(String searchArticle, String searchKeywordString, String startDate, String endDate,
			int searchKeywordInt) {
		super();
		this.searchArticle = searchArticle;
		this.searchKeywordString = searchKeywordString;
		this.startDate = startDate;
		this.endDate = endDate;
		this.searchKeywordInt = searchKeywordInt;
	}
	
	
	public String getSearchArticle() {
		return searchArticle;
	}

	public void setSearchArticle(String searchArticle) {
		this.searchArticle = searchArticle;
	}

	public String getSearchKeywordString() {
		return searchKeywordString;
	}

	public void setSearchKeywordString(String searchKeywordString) {
		this.searchKeywordString = searchKeywordString;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getSearchKeywordInt() {
		return searchKeywordInt;
	}

	public void setSearchKeywordInt(int searchKeywordInt) {
		this.searchKeywordInt = searchKeywordInt;
	}

	@Override
	public String toString() {
		return "SearchVO [searchArticle=" + searchArticle + ", searchKeywordString=" + searchKeywordString
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", searchKeywordInt=" + searchKeywordInt + "]";
	}

	
	
	

	

	
	
	
	

}
