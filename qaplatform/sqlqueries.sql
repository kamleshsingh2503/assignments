CREATE SEQUENCE topic_id_seq start 101;
CREATE TABLE topic (
    topic_id bigint NOT NULL DEFAULT nextval('topic_id_seq'),
	topicname varchar not null,
	primary key(topic_id)
);
ALTER SEQUENCE topic_id_seq OWNED BY topic.topic_id;


CREATE SEQUENCE subtopic_id_seq start 1001;
CREATE TABLE subtopic (
    subtopic_id bigint NOT NULL DEFAULT nextval('subtopic_id_seq'),
	subtopicname varchar NOT NULL,
	topicid bigint,
	primary key(subtopic_id),
	CONSTRAINT fk_topic
      FOREIGN KEY(topicid) 
	  REFERENCES topic(topic_id)
);
ALTER SEQUENCE subtopic_id_seq OWNED BY subtopic.subtopic_id;

CREATE SEQUENCE company_id_seq start 101;
CREATE TABLE company (
    company_id bigint NOT NULL DEFAULT nextval('company_id_seq'),
	companyname varchar not null,
	primary key(company_id)
);
ALTER SEQUENCE company_id_seq OWNED BY company.company_id;

CREATE SEQUENCE question_id_seq start 101;
CREATE TABLE question (
    question_id bigint NOT NULL DEFAULT nextval('question_id_seq'),
	questionText varchar not null,
	company_id bigint, 
	subtopic_id bigint,
	tags
	primary key(question_id)
);
ALTER SEQUENCE question_id_seq OWNED BY question.question_id;

CREATE SEQUENCE answer_id_seq start 101;
CREATE TABLE answer (
    answer_id bigint NOT NULL DEFAULT nextval('answer_id_seq'),
	answerText varchar not null,
	question_id bigint,
	primary key(answer_id),
	CONSTRAINT fk_question
      FOREIGN KEY(question_id) 
	  REFERENCES question(question_id)
);
ALTER SEQUENCE answer_id_seq OWNED BY answer.answer_id;


CREATE SEQUENCE answer_comments_id_seq start 101;
CREATE TABLE answer_comments (
    answer_comments_id bigint NOT NULL DEFAULT nextval('answer_comments_id_seq'),
	commentsText varchar not null,
	answer_id bigint,
	primary key(answer_comments_id),
	CONSTRAINT fk_answer
      FOREIGN KEY(answer_id) 
	  REFERENCES answer(answer_id)
);
ALTER SEQUENCE answer_comments_id_seq OWNED BY answer_comments.answer_comments_id;

CREATE SEQUENCE question_likes_id_seq start 101;
CREATE TABLE question_likes (
    question_likes_id bigint NOT NULL DEFAULT nextval('question_likes_id_seq'),
	questionLikes BOOLEAN not null,
	question_id bigint,
	primary key(question_likes_id),
	CONSTRAINT fk_question
      FOREIGN KEY(question_id) 
	  REFERENCES question(question_id)
);
ALTER SEQUENCE question_likes_id_seq OWNED BY question_likes.question_likes_id;

/*
drop table subtopic;
drop table topic;
drop table company;
drop table question;
drop table answer;
drop table answer_comments;
drop table question_likes;
*/

CREATE SEQUENCE question_company_id_seq start 101;
CREATE TABLE question_company_mapping (
    question_company_id bigint NOT NULL DEFAULT nextval('question_company_id_seq'),
	question_id bigint,
	company_id bigint,
	primary key(question_company_id),
	CONSTRAINT fk_question
      FOREIGN KEY(question_id) 
	  REFERENCES question(question_id),
	CONSTRAINT fk_company
      FOREIGN KEY(company_id) 
	  REFERENCES company(company_id)
);
ALTER SEQUENCE question_company_id_seq OWNED BY question_company_mapping.question_company_id;

CREATE SEQUENCE answer_likes_id_seq start 101;
CREATE TABLE answer_likes (
    answer_likes_id bigint NOT NULL DEFAULT nextval('answer_likes_id_seq'),
	answer_liked BOOLEAN not null,
	answer_id bigint,
	users_id bigint,
	primary key(answer_likes_id),
	CONSTRAINT fk_answer
      FOREIGN KEY(answer_id) 
	  REFERENCES answer(answer_id),
	CONSTRAINT fk_users
      FOREIGN KEY(users_id) 
	  REFERENCES users(users_id)
);
ALTER SEQUENCE answer_likes_id_seq OWNED BY answer_likes.answer_likes_id;

drop table answer_likes;

CREATE SEQUENCE tags_id_seq start 101;
CREATE TABLE tags (
    tags_id bigint NOT NULL DEFAULT nextval('tags_id_seq'),
	tag_text varchar not null,
	primary key(tags_id)
);
ALTER SEQUENCE tags_id_seq OWNED BY tags.tags_id;

CREATE SEQUENCE questiontags_id_seq start 101;
CREATE TABLE question_tags (
    question_tags_id bigint NOT NULL DEFAULT nextval('questiontags_id_seq'),
	tags_id bigint,
	question_id bigint,
	primary key(tags_id),
	CONSTRAINT fk_question
      FOREIGN KEY(question_id) 
	  REFERENCES question(question_id),
	CONSTRAINT fk_tags
      FOREIGN KEY(tags_id) 
	  REFERENCES tags(tags_id)
);
ALTER SEQUENCE questiontags_id_seq OWNED BY question_tags.question_tags_id;

CREATE SEQUENCE user_id_seq start 101;
CREATE TABLE users (
    users_id bigint NOT NULL DEFAULT nextval('user_id_seq'),
	username varchar,
	firstname varchar,
	lastname varchar,
	mobileno bigint,
	primary key(users_id)
);

ALTER SEQUENCE user_id_seq OWNED BY users.users_id;

drop table users;

CREATE SEQUENCE user_questionanswer_mapping_seq_id start 101;
CREATE TABLE users_question_answer (
    question_answer_id bigint NOT NULL DEFAULT nextval('user_questionanswer_mapping_seq_id'),
	question_id bigint,
	answer_id bigint,
	primary key(question_answer_id),
	CONSTRAINT fk_answer
      FOREIGN KEY(answer_id) 
	  REFERENCES answer(answer_id),
	CONSTRAINT fk_question
      FOREIGN KEY(question_id) 
	  REFERENCES question(question_id)
);

ALTER SEQUENCE user_questionanswer_mapping_seq_id OWNED BY users_question_answer.question_answer_id;

CREATE SEQUENCE answer_comments_id_seq start 101;
CREATE TABLE answer_comments (
    answer_comments_id bigint NOT NULL DEFAULT nextval('answer_comments_id_seq'),
	commentsText varchar not null,
	answer_id bigint,
	users_id bigint,
	primary key(answer_comments_id),
	CONSTRAINT fk_answer
      FOREIGN KEY(answer_id) 
	  REFERENCES answer(answer_id),
	CONSTRAINT fk_users
      FOREIGN KEY(users_id) 
	  REFERENCES users(users_id)
);
ALTER SEQUENCE answer_comments_id_seq OWNED BY answer_comments.answer_comments_id;

drop table answer_comments;

drop table answer_comments;

drop table company;
drop table question_company_mapping;

CREATE SEQUENCE company_id_seq start 101;
CREATE TABLE company (
    company_id bigint NOT NULL DEFAULT nextval('company_id_seq'),
	companyname varchar not null,
	primary key(company_id)
);
ALTER SEQUENCE company_id_seq OWNED BY company.company_id;
