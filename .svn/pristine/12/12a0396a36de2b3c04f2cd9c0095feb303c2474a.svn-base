package com.one.command;

public class PageMaker {
	private int totalCount;
	private int startPage = 1;
	private int endPage = 1;
	private int realEndPage;
	private boolean prev;
	private boolean next;

	private int displyPageNum = 10;

	Criteria cri = new Criteria();

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getRealEndPage() {
		return realEndPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getDisplyPageNum() {
		return displyPageNum;
	}

	public void setDisplyPageNum(int displyPageNum) {
		this.displyPageNum = displyPageNum;
	}

	private void calcData() {

		endPage = (int) (Math.ceil(cri.getPage() / (double) displyPageNum) * displyPageNum);
		startPage = (endPage - displyPageNum) + 1;
		realEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		
		if(realEndPage <= 0 ) {
			realEndPage = 1;
		}
		
		if (startPage < 0) {
			startPage = 1;
		}
		if (endPage > realEndPage) {
			endPage = realEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage >= realEndPage ? false : true;

	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

}