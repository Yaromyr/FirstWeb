package com.repository;

import org.springframework.data.repository.CrudRepository;

import com.entity.Photos;

public interface PhotosRepository extends CrudRepository<Photos, Integer>{

}
