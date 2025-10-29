package com.example.tabelogpage.controller;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String index(Model model, @PageableDefault(page = 0, size = 10, sort = "id", direction = Direction.ASC) Pageable pageable){
        
    	 Page<Store> storePage = storeRepository.findAll(pageable);
        
   
        model.addAttribute("storePage", storePage);
        
        // 表示するテンプレートのパスを返す
        // (例: src/main/resources/templates/admin/stores/index.html)
        return "admin/stores/index";
    }  
}