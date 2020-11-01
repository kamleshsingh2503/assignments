package com.qaplatform.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
public class Question {

	private long id;
	private String questionText;

	public Question() {

	}

	public Question(long id, String questionText) {
		super();
		this.id = id;
		this.questionText = questionText;
	}

	@Override
	public String toString() {
		return "Question [id=" + id + ", questionText=" + questionText + "]";
	}

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	@Column(name = "questionText", nullable = false)
	public String getQuestionText() {
		return questionText;
	}

	public void setQuestionText(String questionText) {
		this.questionText = questionText;
	}

}
