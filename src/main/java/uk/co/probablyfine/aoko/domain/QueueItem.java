package uk.co.probablyfine.aoko.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToOne;

import uk.co.probablyfine.aoko.util.PlayerState;

@Entity
public class QueueItem implements Comparable<QueueItem>{

	@Id
	@GeneratedValue
	private int id;
	
	private int bucket;
	
	private int position;
	
	//HACK
	@OneToOne(targetEntity=MusicFile.class)
	private MusicFile musicFile;
	
	@Column(nullable = false)
	private String userName;
	
	private PlayerState status;
	
	public QueueItem(User user, MusicFile file) {
		this.userName = user.getUsername();
		this.musicFile = file;
		this.setState(PlayerState.QUEUED);
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBucket() {
		return bucket;
	}

	public void setBucket(int bucket) {
		this.bucket = bucket;
	}

	public int getPosition() {
		return position;
	}

	public void setPosition(int position) {
		this.position = position;
	}

	public MusicFile getFile() {
		return musicFile;
	}

	public void setFile(MusicFile file) {
		this.musicFile = file;
	}

	public int compareTo(QueueItem arg0) {
		//TODO: Make this not utterly broken		
		return -1;
		
	}

	public void setState(PlayerState state) {
		this.status = state;
	}

	public PlayerState getState() {
		return status;
	}

	
}
