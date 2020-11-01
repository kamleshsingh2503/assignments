package com.qaplatform.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.qaplatform.models.Topic;

public interface TopicRepository extends JpaRepository<Topic, Long>{

}