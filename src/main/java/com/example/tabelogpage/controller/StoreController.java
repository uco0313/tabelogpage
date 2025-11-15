package com.example.tabelogpage.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
    public String index(@RequestParam(name = "keyword", required = false) String keyword,
                        @RequestParam(name = "area", required = false) String area,
                        @RequestParam(name = "priceMin", required = false) Integer priceMin, 
                        @RequestParam(name = "priceMax", required = false) Integer priceMax,  
                        @RequestParam(name = "categoryId", required = false) Integer categoryId, 
                        @PageableDefault(page = 0, size = 10, sort = "id", direction = Direction.ASC) Pageable pageable,
                        Model model) 
    {
        Page<Store> storePage;
                
        // 検索ロジックの修正: categoryIdの有無で分岐
        
        if (categoryId != null) {
            
            String keywordForQuery = keyword != null ? "%" + keyword + "%" : null;
            String areaForQuery = area != null ? "%" + area + "%" : null;

            if (priceMin != null && priceMax != null) { 
                // カテゴリ AND 価格帯で検索
                storePage = storeRepository.findByPriceMinGreaterThanEqualAndPriceMaxLessThanEqualAndCategoryId(priceMin, priceMax, categoryId, pageable);
            } else if (keyword != null && !keyword.isEmpty()) {
                // カテゴリ AND キーワード（店舗名/住所）で検索
                storePage = storeRepository.findByStoreNameLikeOrAddressLikeAndCategoryId(keywordForQuery, keywordForQuery, categoryId, pageable);
            } else if (area != null && !area.isEmpty()) {
                // カテゴリ AND エリアで検索
                storePage = storeRepository.findByAddressLikeAndCategoryId(areaForQuery, categoryId, pageable);
            } else if (priceMax!= null) { 
                // カテゴリ AND 最大価格で検索（店舗の最大価格 <= 入力された価格）
                storePage = storeRepository.findByPriceMaxLessThanEqualAndCategoryId(priceMax, categoryId, pageable);
            } else if (priceMin != null) { 
                // カテゴリ AND 最小価格で検索（店舗の最小価格 >= 入力された価格）
                storePage = storeRepository.findByPriceMinGreaterThanEqualAndCategoryId(priceMin, categoryId, pageable);
            } else { 
                // カテゴリのみで検索
                storePage = storeRepository.findByCategoryId(categoryId, pageable);
            }         
        } else {
            // カテゴリIDが指定されていない場合は、従来のロジックを使用
            if (priceMin != null && priceMax != null) { 
                // 最小価格と最大価格の範囲で検索
                storePage = storeRepository.findByPriceMinGreaterThanEqualAndPriceMaxLessThanEqual(priceMin, priceMax, pageable);
                
            } else if (keyword != null && !keyword.isEmpty()) {
                storePage = storeRepository.findByStoreNameLikeOrAddressLike("%" + keyword + "%", "%" + keyword + "%", pageable);
            } else if (area != null && !area.isEmpty()) {
                storePage = storeRepository.findByAddressLike("%" + area + "%", pageable);
            } else if (priceMax!= null) { 
                // 最大価格のみ指定されている場合（店舗の最大価格 <= 入力された価格）
                storePage = storeRepository.findByPriceMaxLessThanEqual(priceMax, pageable);
                
            } else if (priceMin != null) { 
                // 最小価格のみ指定されている場合（店舗の最小価格 >= 入力された価格）
                storePage = storeRepository.findByPriceMinGreaterThanEqual(priceMin, pageable);
                
            } else { 
                // どちらも指定されていない場合 (全件検索)
                storePage = storeRepository.findAll(pageable);
            }         
        }
        
        model.addAttribute("storePage", storePage);
        model.addAttribute("keyword", keyword);
        model.addAttribute("area", area);
        model.addAttribute("priceMin", priceMin);
        model.addAttribute("priceMax", priceMax);
        model.addAttribute("categoryId", categoryId); 
        model.addAttribute("categories", categoryRepository.findAll()); 
        
        return "stores/index";
    }
}