package com.example.tabelogpage.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.example.tabelogpage.entity.Store;


public interface StoreRepository extends JpaRepository<Store, Integer> {

}