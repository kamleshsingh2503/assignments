package com.qaplatform.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qaplatform.models.Company;
import com.qaplatform.models.Topic;
import com.qaplatform.service.TopicService;

@Controller
@RequestMapping("/topic")
public class TopicController {
	
	@Autowired
	private TopicService service;
	
	@GetMapping("/getAllTopics")
	public ResponseEntity getAllTopics() {
		return service.getAllTopics();
	} 	
	
	@GetMapping("/getTopicsById")
	public ResponseEntity getTopics(@PathVariable long id) {
		return service.getTopics(id);
	} 	
	
	@PostMapping("/addTopics")
	public ResponseEntity addTopics(@RequestBody Topic topic) {
		return ResponseEntity.ok(service.addTopic(topic));
	} 	
	
	@PutMapping("/updateTopics/{id}")
	public ResponseEntity updateTopic(@RequestBody Topic topic, @PathVariable long id) {
		return service.updateTopic(topic, id);
	}
	
	@DeleteMapping("/deleteTopics/{id}")
	public ResponseEntity deleteTopics(@PathVariable long id ) {
		return ResponseEntity.ok(service.deleteTopic(id));
	}
	
}
