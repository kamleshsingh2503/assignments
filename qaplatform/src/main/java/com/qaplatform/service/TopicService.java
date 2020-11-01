package com.qaplatform.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import com.qaplatform.dao.TopicRepository;
import com.qaplatform.models.Company;
import com.qaplatform.models.Topic;

@Component
public class TopicService {
	
	@Autowired
	private TopicRepository repository;
	
	public ResponseEntity getTopics(long id) {
		Optional<Topic> topicOptional = repository.findById(id);

		if (!topicOptional.isPresent())
			return ResponseEntity.notFound().build();
		else
			return ResponseEntity.ok(topicOptional);
	}
	
	public ResponseEntity getAllTopics() {
		List<Topic> allTopics= new ArrayList<>();
		
		allTopics = repository.findAll();
		if (allTopics.isEmpty())
			return ResponseEntity.notFound().build();
		else
			return ResponseEntity.ok(allTopics);
	}
	
	public Topic deleteTopic(long topicId) {
		repository.deleteById(topicId);
		return null;
	}

	public ResponseEntity updateTopic(Topic topic, long id) {
		Optional<Topic> topicOptional = repository.findById(id);

		if (!topicOptional.isPresent())
			return ResponseEntity.notFound().build();
		else
			return ResponseEntity.ok(repository.save(topic));
	}
	
	public Topic addTopic(Topic topic) {
		return repository.save(topic);
	}

}