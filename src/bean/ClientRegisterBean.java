package bean;

public class ClientRegisterBean {
	private String clientId;
	private String clientName;
	private String clientEmail;
	private String clientBirth;
	private String clientTel;
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public String getClientEmail() {
		return clientEmail;
	}
	public void setClientEmail(String clientEmail) {
		this.clientEmail = clientEmail;
	}
	public String getClientBirth() {
		return clientBirth;
	}
	public void setClientBirth(String clientBirth) {
		this.clientBirth = clientBirth;
	}
	public String getClientTel() {
		return clientTel;
	}
	public void setClientTel(String clientTel) {
		this.clientTel = clientTel;
	}
	@Override
	public String toString() {
		return "ClientRegisterBean [clientId=" + clientId + ", clientName=" + clientName + ", clientEmail="
				+ clientEmail + ", clientBirth=" + clientBirth + ", clientTel=" + clientTel + "]";
	}
	
	
}
