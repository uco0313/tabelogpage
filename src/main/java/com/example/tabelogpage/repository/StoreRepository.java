package com.example.tabelogpage.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.tabelogpage.entity.Store;


public interface StoreRepository extends JpaRepository<Store, Integer> {
	public Page<Store> findByStoreNameLike(String keyword, Pageable pageable);
}