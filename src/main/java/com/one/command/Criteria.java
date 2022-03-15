package com.one.command;

public class Criteria {
	private int page = 1;
	private int perPageNum = 15;
	private int startRowNum = 0;
	private String searchType = "";
	private String keyword = "";
	private String sortType = "";

	public Criteria() {

	}

	public Criteria(int page, int perPageNum) {
		super();
		this.page = page;
		this.perPageNum = perPageNum;
		setStartRowNum();
	}

	public Criteria(int page, int perPageNum, String searchType, String keyword, String sortType) {
		super();
		this.page = page;
		this.perPageNum = perPageNum;
		this.searchType = searchType;
		this.keyword = keyword;
		this.sortType = sortType;
		setStartRowNum();
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page > 0) {
			this.page = page;
		} else {
			this.page = 1;
		}
		setStartRowNum();
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum > 0) {
			this.perPageNum = perPageNum;
		} else {
			this.perPageNum = 10;
		}
		setStartRowNum();
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum() {
		this.startRowNum = (this.page - 1) * perPageNum;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSortType() {
		return sortType;
	}

	public void setSortType(String sortType) {
		this.sortType = sortType;
	}

}
