package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.entity.Person;

public interface PersonRepository extends CrudRepository<Person, Integer> ,JpaSpecificationExecutor<Person>{
	 Person findOneByNameName(String login);
	 Person findOneByLogin(String login);
	 Person findOneById(int ID);
	 List<Person> findAllByNameName(String name);
	 @Query("select friend from Person p join p.friends friend where p.id=:principalId and friend.id = :pathVarId")
	 Person findOneFriendById(@Param(value="principalId") int principalId,@Param(value="pathVarId") int pathVarId);
	 @Query("select follower from Person p join p.followers follower where p.id=:principalId and follower.id = :pathVarId")
	 Person findOneFollowerById(@Param(value="principalId") int principalId,@Param(value="pathVarId") int pathVarId);
//	 @Query("select persons from Person p where p.name.name like = :name")
//	 List<Person> searchPeople(@Param(value="name") String name);
}
