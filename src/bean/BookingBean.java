package bean;

public class BookingBean {
	private int pkId;
	private String clientId;
	private String bkDate;
	private int bkTime;
	private int bkPeopleNum;
	public int getPkId() {
		return pkId;
	}
	public void setPkId(int pkId) {
		this.pkId = pkId;
	}
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	public String getBkDate() {
		return bkDate;
	}
	public void setBkDate(String bkDate) {
		this.bkDate = bkDate;
	}
	public int getBkTime() {
		return bkTime;
	}
	public void setBkTime(int bkTime) {
		this.bkTime = bkTime;
	}
	public int getBkPeopleNum() {
		return bkPeopleNum;
	}
	public void setBkPeopleNum(int bkPeopleNum) {
		this.bkPeopleNum = bkPeopleNum;
	}
	@Override
	public String toString() {
		return "BookingBean [pkId=" + pkId + ", clientId=" + clientId + ", bkDate=" + bkDate + ", bkTime=" + bkTime
				+ ", bkPeopleNum=" + bkPeopleNum + "]";
	}
	
	
}
