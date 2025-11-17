package com.example.tabelogpage.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.tabelogpage.entity.Store;
import com.example.tabelogpage.repository.CategoryRepository;
import com.example.tabelogpage.repository.StoreRepository;

@Controller
@RequestMapping("/stores")
public class StoreController {
    private final StoreRepository storeRepository;
    private final CategoryRepository categoryRepository;
    
    public StoreController(StoreRepository storeRepository, CategoryRepository categoryRepository) {
        this.storeRepository = storeRepository;
        this.categoryRepository = categoryRepository;
    }
    
    @GetMapping
    public String index(Model model, 
                        @PageableDefault(page = 0, size = 10, sort = "id", direction = Direction.ASC) Pageable pageable,
                        @RequestParam(name = "keyword", required = false) String keyword,
                        @RequestParam(name = "area", required = false) String area,
                        @RequestParam(name = "priceMin", required = false) Integer priceMin,
                        @RequestParam(name = "priceMax", required = false) Integer priceMax,
                        @RequestParam(name = "categoryId", required = false) Integer categoryId,
                        @RequestParam(name = "order", required = false) String order) {
        
        Page<Store> storePage;
        
        // --- 1. 検索条件の判定と準備 ---
        
        // ソート条件の調整
        if (order != null && order.equals("priceAsc")) {
            // 予算が低い順にソート（昇順）：priceMinを基準
            pageable = PageRequest.of(pageable.getPageNumber(), pageable.getPageSize(), Direction.ASC, "priceMin");
        } else if (order != null && order.equals("priceDesc")) {
            // 予算が高い順にソート（降順）：priceMaxを基準
            pageable = PageRequest.of(pageable.getPageNumber(), pageable.getPageSize(), Direction.DESC, "priceMax");
        }
        
        // 検索条件フラグ
        boolean hasKeyword = (keyword != null && !keyword.isEmpty());
        boolean hasArea = (area != null && !area.isEmpty());
        boolean hasPriceMin = (priceMin != null);
        boolean hasPriceMax = (priceMax != null);
        boolean hasCategory = (categoryId != null);
        
        // クエリ用パラメータ
        String keywordForQuery = hasKeyword ? "%" + keyword + "%" : null;
        String areaForQuery = hasArea ? "%" + area + "%" : null;
        
        
        // --- 2. 複合検索ロジック (キーワードと複合検索を分離) ---
        
        if (hasKeyword) {
            // 【キーワード単独検索】: キーワードが存在する場合、他の条件は無視する
            storePage = storeRepository.findByStoreNameLikeOrAddressLike(keywordForQuery, keywordForQuery, pageable);
            
            // キーワード検索時は他の検索パラメータをリセット
            categoryId = null;
            area = null;
            priceMin = null;
            priceMax = null;
            
        } else {
            // 【複合検索】: キーワードが存在しない場合、C, A, Pmin, Pmax の複合検索を実行

            if (hasCategory) {
                // --- カテゴリIDがある場合の複合検索ロジック（Kなし） ---
                
                if (hasArea && hasPriceMin && hasPriceMax) {
                    // A, Pmin, Pmax, C の全て
                    storePage = storeRepository.findByAddressLikeAndPriceMinGreaterThanEqualAndPriceMaxLessThanEqualAndCategoryId(
                        areaForQuery, priceMin, priceMax, categoryId, pageable);
                } else if (hasArea && hasPriceMin) {
                    // A, Pmin, C
                    storePage = storeRepository.findByAddressLikeAndPriceMinGreaterThanEqualAndCategoryId(areaForQuery, priceMin, categoryId, pageable);
                } else if (hasArea && hasPriceMax) {
                    // A, Pmax, C
                    storePage = storeRepository.findByAddressLikeAndPriceMaxLessThanEqualAndCategoryId(areaForQuery, priceMax, categoryId, pageable);
                } else if (hasPriceMin && hasPriceMax) {
                    // Pmin, Pmax, C
                    storePage = storeRepository.findByPriceMinGreaterThanEqualAndPriceMaxLessThanEqualAndCategoryId(priceMin, priceMax, categoryId, pageable);
                } else if (hasArea) {
                    // A, C
                    storePage = storeRepository.findByAddressLikeAndCategoryId(areaForQuery, categoryId, pageable);
                } else if (hasPriceMax) {
                    // Pmax, C
                    storePage = storeRepository.findByPriceMaxLessThanEqualAndCategoryId(priceMax, categoryId, pageable);
                } else if (hasPriceMin) {
                    // Pmin, C
                    storePage = storeRepository.findByPriceMinGreaterThanEqualAndCategoryId(priceMin, categoryId, pageable);
                } else {
                    // C のみ
                    storePage = storeRepository.findByCategoryId(categoryId, pageable);
                }
                
            } else {
                // --- カテゴリIDがない場合の複合検索ロジック（Kなし） ---

                if (hasArea && hasPriceMin && hasPriceMax) {
                    // A, Pmin, Pmax
                    storePage = storeRepository.findByAddressLikeAndPriceMinGreaterThanEqualAndPriceMaxLessThanEqual(
                        areaForQuery, priceMin, priceMax, pageable);
                } else if (hasArea && hasPriceMin) {
                    // A, Pmin
                    storePage = storeRepository.findByAddressLikeAndPriceMinGreaterThanEqual(areaForQuery, priceMin, pageable);
                } else if (hasArea && hasPriceMax) {
                    // A, Pmax
                    storePage = storeRepository.findByAddressLikeAndPriceMaxLessThanEqual(areaForQuery, priceMax, pageable);
                } else if (hasPriceMin && hasPriceMax) {
                    // Pmin, Pmax
                    storePage = storeRepository.findByPriceMinGreaterThanEqualAndPriceMaxLessThanEqual(priceMin, priceMax, pageable);
                } else if (hasArea) {
                    // A のみ
                    storePage = storeRepository.findByAddressLike(areaForQuery, pageable);
                } else if (hasPriceMax) {
                    // Pmax のみ
                    storePage = storeRepository.findByPriceMaxLessThanEqual(priceMax, pageable);
                } else if (hasPriceMin) {
                    // Pmin のみ
                    storePage = storeRepository.findByPriceMinGreaterThanEqual(priceMin, pageable);
                } else {
                    // どちらも指定されていない場合 (全件検索)
                    storePage = storeRepository.findAll(pageable);
                }
            }
        }
        
        // --- 3. Modelへの追加 ---
        
        model.addAttribute("storePage", storePage);
        model.addAttribute("categoryList", categoryRepository.findAll());
        
        // 検索条件をビューに渡す (hasKeywordブロックでリセットされた値も含む)
        model.addAttribute("keyword", keyword);
        model.addAttribute("area", area);
        model.addAttribute("priceMin", priceMin);
        model.addAttribute("priceMax", priceMax);
        model.addAttribute("categoryId", categoryId);
        model.addAttribute("order", order);
        
        return "stores/index";
    }
    
    @GetMapping("/{id}")
    public String show(@PathVariable(name = "id") Integer id, Model model) {
        Store store = storeRepository.getReferenceById(id);
        
        model.addAttribute("store", store);         
        
        return "stores/show";
    }    
}