package vo;

import java.util.Date;

public class BoardVO {

	private int bNum;
	private String bWriter;
	private int bPw;
	private String bTitle;
	private String bContent;
	private Date bWriteDate;
	private int bReadCount;
	private String bAddress;
	private String bLocation;
	private String bTime;
//	private Date bTime;
	private int bMatchCheck;
	
	
	public BoardVO() {
		// TODO Auto-generated constructor stub
	}

	public BoardVO(int bNum, String bWriter, int bPw, String bTitle, String bContent, Date bWriteDate, int bReadCount,
			String bAddress, String bLocation, String bTime, int bMatchCheck) {
		super();
		this.bNum = bNum;
		this.bWriter = bWriter;
		this.bPw = bPw;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriteDate = bWriteDate;
		this.bReadCount = bReadCount;
		this.bAddress = bAddress;
		this.bLocation = bLocation;
		this.bTime = bTime;
		this.bMatchCheck = bMatchCheck;
	}

	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public int getbPw() {
		return bPw;
	}

	public void setbPw(int bPw) {
		this.bPw = bPw;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Date getbWriteDate() {
		return bWriteDate;
	}

	public void setbWriteDate(Date bWriteDate) {
		this.bWriteDate = bWriteDate;
	}

	public int getbReadCount() {
		return bReadCount;
	}

	public void setbReadCount(int bReadCount) {
		this.bReadCount = bReadCount;
	}

	public String getbAddress() {
		return bAddress;
	}

	public void setbAddress(String bAddress) {
		this.bAddress = bAddress;
	}

	public String getbLocation() {
		return bLocation;
	}

	public void setbLocation(String bLocation) {
		this.bLocation = bLocation;
	}

	public String getbTime() {
		return bTime;
	}

	public void setbTime(String bTime) {
		this.bTime = bTime;
	}

	public int getbMatchCheck() {
		return bMatchCheck;
	}

	public void setbMatchCheck(int bMatchCheck) {
		this.bMatchCheck = bMatchCheck;
	}

	@Override
	public String toString() {
		return "BoardVO [bNum=" + bNum + ", bWriter=" + bWriter + ", bPw=" + bPw + ", bTitle=" + bTitle + ", bContent="
				+ bContent + ", bWriteDate=" + bWriteDate + ", bReadCount=" + bReadCount + ", bAddress=" + bAddress
				+ ", bLocation=" + bLocation + ", bTime=" + bTime + ", bMatchCheck=" + bMatchCheck + "]";
	}
	
	
	
//	public BoardVO() {
//		// TODO Auto-generated constructor stub
//	}
//
//	public BoardVO(int bNum, String bWriter, int bPw, String bTitle, String bContent, Date bWriteDate, int bReadCount,
//			String bAddress, String bLocation, Date bTime, int bMatchCheck) {
//		super();
//		this.bNum = bNum;
//		this.bWriter = bWriter;
//		this.bPw = bPw;
//		this.bTitle = bTitle;
//		this.bContent = bContent;
//		this.bWriteDate = bWriteDate;
//		this.bReadCount = bReadCount;
//		this.bAddress = bAddress;
//		this.bLocation = bLocation;
//		this.bTime = bTime;
//		this.bMatchCheck = bMatchCheck;
//	}
//
//	public int getbNum() {
//		return bNum;
//	}
//
//	public void setbNum(int bNum) {
//		this.bNum = bNum;
//	}
//
//	public String getbWriter() {
//		return bWriter;
//	}
//
//	public void setbWriter(String bWriter) {
//		this.bWriter = bWriter;
//	}
//
//	public int getbPw() {
//		return bPw;
//	}
//
//	public void setbPw(int bPw) {
//		this.bPw = bPw;
//	}
//
//	public String getbTitle() {
//		return bTitle;
//	}
//
//	public void setbTitle(String bTitle) {
//		this.bTitle = bTitle;
//	}
//
//	public String getbContent() {
//		return bContent;
//	}
//
//	public void setbContent(String bContent) {
//		this.bContent = bContent;
//	}
//
//	public Date getbWriteDate() {
//		return bWriteDate;
//	}
//
//	public void setbWriteDate(Date bWriteDate) {
//		this.bWriteDate = bWriteDate;
//	}
//
//	public int getbReadCount() {
//		return bReadCount;
//	}
//
//	public void setbReadCount(int bReadCount) {
//		this.bReadCount = bReadCount;
//	}
//
//	public String getbAddress() {
//		return bAddress;
//	}
//
//	public void setbAddress(String bAddress) {
//		this.bAddress = bAddress;
//	}
//
//	public String getbLocation() {
//		return bLocation;
//	}
//
//	public void setbLocation(String bLocation) {
//		this.bLocation = bLocation;
//	}
//
//	public Date getbTime() {
//		return bTime;
//	}
//
//	public void setbTime(Date bTime) {
//		this.bTime = bTime;
//	}
//
//	public int getbMatchCheck() {
//		return bMatchCheck;
//	}
//
//	public void setbMatchCheck(int bMatchCheck) {
//		this.bMatchCheck = bMatchCheck;
//	}
//
//	@Override
//	public String toString() {
//		return "BoardVO [bNum=" + bNum + ", bWriter=" + bWriter + ", bPw=" + bPw + ", bTitle=" + bTitle + ", bContent="
//				+ bContent + ", bWriteDate=" + bWriteDate + ", bReadCount=" + bReadCount + ", bAddress=" + bAddress
//				+ ", bLocation=" + bLocation + ", bTime=" + bTime + ", bMatchCheck=" + bMatchCheck + "]";
//	}
//	

	
}