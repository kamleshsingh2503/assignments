package com.qaplatform.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qaplatform.dao.QuestionRepository;
import com.qaplatform.models.Question;

@Component
public class QuestionService {
	
	@Autowired
	private QuestionRepository questionRepository;
	
    public Question addQuestion(Question question) {
        return questionRepository.save(question);
    }

}
