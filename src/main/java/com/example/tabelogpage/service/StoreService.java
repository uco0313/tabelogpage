package com.example.tabelogpage.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalTime;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional; // ★ トランザクション制御のImport
import org.springframework.web.multipart.MultipartFile;

import com.example.tabelogpage.entity.Category;
import com.example.tabelogpage.entity.Store;
import com.example.tabelogpage.form.StoreRegisterForm;
import com.example.tabelogpage.repository.CategoryRepository;
import com.example.tabelogpage.repository.StoreRepository;

@Service
@Transactional
public class StoreService {
    private final StoreRepository storeRepository;
    private final CategoryRepository categoryRepository; 
    
  
    public StoreService(StoreRepository storeRepository, CategoryRepository categoryRepository) {
        this.storeRepository = storeRepository;
        this.categoryRepository = categoryRepository;
    }
    
    
    public void create(StoreRegisterForm storeRegisterForm) { 
        Store store = new Store();
        
   
        Category category = categoryRepository.getReferenceById(storeRegisterForm.getCategoryId());
        store.setCategory(category); 
        // -------------------------------------------------------------
        
        MultipartFile imageFile = storeRegisterForm.getImageFile();
        
        if (!imageFile.isEmpty()) {
            String imageName = imageFile.getOriginalFilename(); 
            String hashedImageName = generateNewFileName(imageName);
            Path filePath = Paths.get("src/main/resources/static/storage/" + hashedImageName);
            copyImageFile(imageFile, filePath);
            store.setImagePath(hashedImageName);
        }
        
        
        store.setStoreName(storeRegisterForm.getName());                
        store.setDescription(storeRegisterForm.getDescription());
        
        store.setPriceMin(storeRegisterForm.getPriceMin());
        store.setPriceMax(storeRegisterForm.getPriceMax());
        
   
        store.setOpeningTime(LocalTime.parse(storeRegisterForm.getOpeningTime()));
        store.setClosingTime(LocalTime.parse(storeRegisterForm.getClosingTime()));
        
        store.setPostalCode(storeRegisterForm.getPostalCode());
        store.setAddress(storeRegisterForm.getAddress());
        store.setPhoneNumber(storeRegisterForm.getPhoneNumber());
        
        store.setRegularHoliday(storeRegisterForm.getRegularHoliday());
                                
        storeRepository.save(store);
    } 
    
    public String generateNewFileName(String fileName) {
        String[] fileNames = fileName.split("\\.");             
        for (int i = 0; i < fileNames.length - 1; i++) {
            fileNames[i] = UUID.randomUUID().toString();            
        }
        String hashedFileName = String.join(".", fileNames);
        return hashedFileName;
    }       
    
    
    public void copyImageFile(MultipartFile imageFile, Path filePath) {           
        try {
            Files.copy(imageFile.getInputStream(), filePath);
        } catch (IOException e) {
            e.printStackTrace();
        }         
    } 
}