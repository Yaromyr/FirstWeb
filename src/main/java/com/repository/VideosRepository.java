package com.repository;


import org.springframework.data.repository.CrudRepository;

import com.entity.Videos;

public interface VideosRepository extends CrudRepository<Videos, Integer> {

}
