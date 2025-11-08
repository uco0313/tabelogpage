package com.example.tabelogpage.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.example.tabelogpage.entity.User;


public interface UserRepository extends JpaRepository<User, Integer> {	

}