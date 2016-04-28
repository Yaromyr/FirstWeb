package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.entity.ApplicationToFriends;



public interface ApplicationToFriendsRepository extends CrudRepository<ApplicationToFriends, Integer>{
	ApplicationToFriends findOneByReciverId(int id);
	List<ApplicationToFriends> findByReciverId(int id);
	@Query("select a from ApplicationToFriends a join a.reciver r join a.sender s where r.id = :pathVarId and s.id = :principalId")
	ApplicationToFriends findApplicationByPersons(@Param(value="principalId") int principalId,@Param(value="pathVarId") int pathVarId);
}
