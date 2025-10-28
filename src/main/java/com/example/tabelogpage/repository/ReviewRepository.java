package com.example.tabelogpage.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.tabelogpage.entity.Review; 

public interface ReviewRepository extends JpaRepository<Review, Integer> {

}