package com.example.tabelogpage.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.tabelogpage.entity.Reservation; 

public interface ReservationRepository extends JpaRepository<Reservation, Integer> {

}