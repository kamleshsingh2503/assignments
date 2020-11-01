package com.qaplatform.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Topic {

	private long id;
	private String topicName;

	public Topic() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Topic(long id, String topicName) {
		super();
		this.id = id;
		this.topicName = topicName;
	}

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@Column(name = "topicname", nullable = false)
	public String getTopicName() {
		return topicName;
	}

	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}

	@Override
	public String toString() {
		return "Topic [topicId=" + id + ", topicName=" + topicName + "]";
	}
	

}