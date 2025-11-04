package com.example.tabelogpage.controller;


import org.springframework.data.domain.Page;
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
import com.example.tabelogpage.repository.StoreRepository;

@Controller
@RequestMapping("/admin/stores") 
public class AdminStoreController {
    

    private final StoreRepository storeRepository;
    
    public AdminStoreController(StoreRepository storeRepository) {
        this.storeRepository = storeRepository;
    }
    
    @GetMapping 
    public String index(Model model, @PageableDefault(page = 0, size = 10, sort = "id", direction = Direction.ASC) Pageable pageable, @RequestParam(name = "keyword", required = false) String keyword){
        
    	 Page<Store> storePage;
    	 
    	 if (keyword != null && !keyword.isEmpty()) {
    		 storePage = storeRepository.findByStoreNameLike("%" + keyword + "%", pageable);                
         } else {
        	 storePage = storeRepository.findAll(pageable);
         }  
        
   
        model.addAttribute("storePage", storePage);
        model.addAttribute("keyword", keyword);
        
        // 表示するテンプレートのパスを返す
        // (例: src/main/resources/templates/admin/stores/index.html)
        return "admin/stores/index";
    } 
    
    @GetMapping("/{id}")
    public String show(@PathVariable(name = "id") Integer id, Model model) {
        Store store = storeRepository.getReferenceById(id);
        
        model.addAttribute("store", store);
        
        return "admin/stores/show";
    }    
}