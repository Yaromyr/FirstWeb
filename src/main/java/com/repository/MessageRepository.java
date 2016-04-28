package com.repository;

import org.springframework.data.repository.CrudRepository;

import com.entity.Message;

public interface MessageRepository extends CrudRepository<Message,Integer> {

}
