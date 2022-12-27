package vo;

import java.util.Date;

public class CommentVO {
	private int cNum;
	private String cWriter;
	private int cBoardNum;
	private String cContent;
	private Date cWriteDate;
	private int cSub;
	private int cSubStep;
	private int cAsk;
	private int cAccept;
	
	public CommentVO() {
	}

	public CommentVO(int cNum, String cWriter, int cBoardNum, String cContent, Date cWriteDate, int cSub, int cSubStep,
			int cAsk, int cAccept) {
		super();
		this.cNum = cNum;
		this.cWriter = cWriter;
		this.cBoardNum = cBoardNum;
		this.cContent = cContent;
		this.cWriteDate = cWriteDate;
		this.cSub = cSub;
		this.cSubStep = cSubStep;
		this.cAsk = cAsk;
		this.cAccept = cAccept;
	}

	public int getcNum() {
		return cNum;
	}

	public void setcNum(int cNum) {
		this.cNum = cNum;
	}

	public String getcWriter() {
		return cWriter;
	}

	public void setcWriter(String cWriter) {
		this.cWriter = cWriter;
	}

	public int getcBoardNum() {
		return cBoardNum;
	}

	public void setcBoardNum(int cBoardNum) {
		this.cBoardNum = cBoardNum;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public Date getcWriteDate() {
		return cWriteDate;
	}

	public void setcWriteDate(Date cWriteDate) {
		this.cWriteDate = cWriteDate;
	}

	public int getcSub() {
		return cSub;
	}

	public void setcSub(int cSub) {
		this.cSub = cSub;
	}

	public int getcSubStep() {
		return cSubStep;
	}

	public void setcSubStep(int cSubStep) {
		this.cSubStep = cSubStep;
	}

	public int getcAsk() {
		return cAsk;
	}

	public void setcAsk(int cAsk) {
		this.cAsk = cAsk;
	}

	public int getcAccept() {
		return cAccept;
	}

	public void setcAccept(int cAccept) {
		this.cAccept = cAccept;
	}

	@Override
	public String toString() {
		return "CommentVO [cNum=" + cNum + ", cWriter=" + cWriter + ", cBoardNum=" + cBoardNum + ", cContent="
				+ cContent + ", cWriteDate=" + cWriteDate + ", cSub=" + cSub + ", cSubStep=" + cSubStep + ", cAsk="
				+ cAsk + ", cAccept=" + cAccept + "]";
	}
	
}