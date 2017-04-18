package bean;

public class ktvBean {
	private int cashboxId;
	private String songLang;
	private String songSongName;
	private String songSinger;
	
	public int getCashboxId() {
		return cashboxId;
	}
	public void setCashboxId(int cashboxId) {
		this.cashboxId = cashboxId;
	}
	public String getSongLang() {
		return songLang;
	}
	public void setSongLang(String songLang) {
		this.songLang = songLang;
	}
	public String getSongSongName() {
		return songSongName;
	}
	public void setSongSongName(String songSongName) {
		this.songSongName = songSongName;
	}
	public String getSongSinger() {
		return songSinger;
	}
	public void setSongSinger(String songSinger) {
		this.songSinger = songSinger;
	}
	@Override
	public String toString() {
		return "ktvBean [cashboxId=" + cashboxId + ", songLang=" + songLang + ", songSongName=" + songSongName
				+ ", songSinger=" + songSinger + "]";
	}
	
}
