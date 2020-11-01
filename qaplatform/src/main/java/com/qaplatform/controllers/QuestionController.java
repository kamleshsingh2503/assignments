package com.qaplatform.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qaplatform.models.Question;
import com.qaplatform.service.QuestionService;

@Controller
@RequestMapping("/qaPlatform/")
public class QuestionController {

	@Autowired
	private QuestionService questionService;
	
	@PostMapping("/addQuestions")
	public ResponseEntity addQuestion(@RequestBody Question question ) {
		return ResponseEntity.ok(questionService.addQuestion(question));
	}
	
}
