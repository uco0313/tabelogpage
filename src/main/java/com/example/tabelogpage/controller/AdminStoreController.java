package com.example.tabelogpage.controller;

import java.util.List;

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
    public String index(Model model) {
        
        List<Store> stores = storeRepository.findAll();
        
   
        model.addAttribute("stores", stores);
        
        // 表示するテンプレートのパスを返す
        // (例: src/main/resources/templates/admin/stores/index.html)
        return "admin/stores/index";
    }  
}