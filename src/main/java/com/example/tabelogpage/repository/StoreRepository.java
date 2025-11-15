package com.example.tabelogpage.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.tabelogpage.entity.Store;


public interface StoreRepository extends JpaRepository<Store, Integer> {
	// 単独検索（店舗名）
	public Page<Store> findByStoreNameLike(String keyword, Pageable pageable);

	// 店舗名(storeName) または 住所(Address) で検索
	public Page<Store> findByStoreNameLikeOrAddressLike(String nameKeyword, String addressKeyword, Pageable pageable);    
    
	// 単独検索（住所）
	public Page<Store> findByAddressLike(String area, Pageable pageable);
    
    // 最大価格以下の単独検索（店舗の最大価格 <= 入力された価格）
    public Page<Store> findByPriceMaxLessThanEqual(Integer priceMax, Pageable pageable);
    
    // 最小価格以上の単独検索（店舗の最小価格 >= 入力された価格）
    public Page<Store> findByPriceMinGreaterThanEqual(Integer priceMin, Pageable pageable);
    
    // PriceMinが指定された値以上 AND PriceMaxが指定された値以下の店舗を検索
    public Page<Store> findByPriceMinGreaterThanEqualAndPriceMaxLessThanEqual(Integer priceMin, Integer priceMax, Pageable pageable);
    
    // 店舗の最大価格が、指定された金額以上である店舗を検索する（最小価格検索用）
    public Page<Store> findByPriceMaxGreaterThanEqual(Integer priceMin, Pageable pageable);
    
    // 店舗の最小価格が、指定された金額以下である店舗を検索する（最大価格検索用）
    public Page<Store> findByPriceMinLessThanEqual(Integer priceMax, Pageable pageable);
    
    // カテゴリIDによる単独検索
    public Page<Store> findByCategoryId(Integer categoryId, Pageable pageable);
    
    // 店舗名/住所 と カテゴリID による複合検索
    public Page<Store> findByStoreNameLikeOrAddressLikeAndCategoryId(String nameKeyword, String addressKeyword, Integer categoryId, Pageable pageable);
    
    // エリア と カテゴリID による複合検索
    public Page<Store> findByAddressLikeAndCategoryId(String area, Integer categoryId, Pageable pageable);
    
    // 最大価格以下の店舗 と カテゴリID による複合検索
    public Page<Store> findByPriceMaxLessThanEqualAndCategoryId(Integer priceMax, Integer categoryId, Pageable pageable);
    
    // 最小価格以上の店舗 と カテゴリID による複合検索
    public Page<Store> findByPriceMinGreaterThanEqualAndCategoryId(Integer priceMin, Integer categoryId, Pageable pageable);
    
    // 価格帯(Min & Max) と カテゴリID による複合検索
    public Page<Store> findByPriceMinGreaterThanEqualAndPriceMaxLessThanEqualAndCategoryId(Integer priceMin, Integer priceMax, Integer categoryId, Pageable pageable);
}