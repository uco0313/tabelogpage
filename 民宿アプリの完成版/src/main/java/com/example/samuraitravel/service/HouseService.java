package com.example.samuraitravel.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Optional; // ★追加
import java.util.UUID;

import org.springframework.data.domain.Page; // ★追加
import org.springframework.data.domain.Pageable; // ★追加
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.samuraitravel.entity.House;
import com.example.samuraitravel.form.HouseEditForm;
import com.example.samuraitravel.form.HouseRegisterForm;
import com.example.samuraitravel.repository.HouseRepository;

@Service
public class HouseService {
    private final HouseRepository houseRepository;
    
    public HouseService(HouseRepository houseRepository) {
        this.houseRepository = houseRepository;
    }
    
    // ==========================================================
    // コントローラーで使用される検索・取得メソッド (以前の質問で必要だったメソッド群)
    // ==========================================================
    
    /**
     * IDに基づいてHouseエンティティを検索し、Optionalで返します。
     * ReviewController および HouseController の show() で利用されます。
     */
    public Optional<House> findHouseById(Integer id) { 
        return houseRepository.findById(id);
    }
    
    /**
     * 価格の昇順で全てのHouseエンティティをページングして返します。（HouseControllerのindex()で利用）
     */
    public Page<House> findAllByOrderByPriceAsc(Pageable pageable) {
        return houseRepository.findAllByOrderByPriceAsc(pageable);
    }

    /**
     * 作成日時の降順で全てのHouseエンティティをページングして返します。（HouseControllerのindex()で利用）
     */
    public Page<House> findAllByOrderByCreatedAtDesc(Pageable pageable) {
        return houseRepository.findAllByOrderByCreatedAtDesc(pageable);
    }
    
    /**
     * キーワード検索（名前 or 住所）と価格昇順ソート
     */
    public Page<House> findByNameLikeOrAddressLikeOrderByPriceAsc(String keywordName, String keywordAddress, Pageable pageable) {
        return houseRepository.findByNameLikeOrAddressLikeOrderByPriceAsc(keywordName, keywordAddress, pageable);
    }

    /**
     * キーワード検索（名前 or 住所）と作成日時降順ソート
     */
    public Page<House> findByNameLikeOrAddressLikeOrderByCreatedAtDesc(String keywordName, String keywordAddress, Pageable pageable) {
        return houseRepository.findByNameLikeOrAddressLikeOrderByCreatedAtDesc(keywordName, keywordAddress, pageable);
    }
    
    /**
     * エリア検索（住所）と価格昇順ソート
     */
    public Page<House> findByAddressLikeOrderByPriceAsc(String area, Pageable pageable) {
        return houseRepository.findByAddressLikeOrderByPriceAsc(area, pageable);
    }

    /**
     * エリア検索（住所）と作成日時降順ソート
     */
    public Page<House> findByAddressLikeOrderByCreatedAtDesc(String area, Pageable pageable) {
        return houseRepository.findByAddressLikeOrderByCreatedAtDesc(area, pageable);
    }
    
    /**
     * 価格以下検索と価格昇順ソート
     */
    public Page<House> findByPriceLessThanEqualOrderByPriceAsc(Integer price, Pageable pageable) {
        return houseRepository.findByPriceLessThanEqualOrderByPriceAsc(price, pageable);
    }
    
    /**
     * 価格以下検索と作成日時降順ソート
     */
    public Page<House> findByPriceLessThanEqualOrderByCreatedAtDesc(Integer price, Pageable pageable) {
        return houseRepository.findByPriceLessThanEqualOrderByCreatedAtDesc(price, pageable);
    }
    
    // ==========================================================
    // 既存のメソッド
    // ==========================================================
    
    @Transactional
    public void create(HouseRegisterForm houseRegisterForm) {
        House house = new House();
        MultipartFile imageFile = houseRegisterForm.getImageFile();
        
        if (!imageFile.isEmpty()) {
            String imageName = imageFile.getOriginalFilename();
            String hashedImageName = generateNewFileName(imageName);
            Path filePath = Paths.get("src/main/resources/static/storage/" + hashedImageName);
            copyImageFile(imageFile, filePath);
            house.setImageName(hashedImageName);
        }
        
        house.setName(houseRegisterForm.getName());
        house.setDescription(houseRegisterForm.getDescription());
        house.setPrice(houseRegisterForm.getPrice());
        house.setCapacity(houseRegisterForm.getCapacity());
        house.setPostalCode(houseRegisterForm.getPostalCode());
        house.setAddress(houseRegisterForm.getAddress());
        house.setPhoneNumber(houseRegisterForm.getPhoneNumber());
                        
        houseRepository.save(house);
    }
    
    @Transactional
    public void update(HouseEditForm houseEditForm) {
        House house = houseRepository.getReferenceById(houseEditForm.getId());
        MultipartFile imageFile = houseEditForm.getImageFile();
        
        if (!imageFile.isEmpty()) {
            String imageName = imageFile.getOriginalFilename();
            String hashedImageName = generateNewFileName(imageName);
            Path filePath = Paths.get("src/main/resources/static/storage/" + hashedImageName);
            copyImageFile(imageFile, filePath);
            house.setImageName(hashedImageName);
        }
        
        house.setName(houseEditForm.getName());
        house.setDescription(houseEditForm.getDescription());
        house.setPrice(houseEditForm.getPrice());
        house.setCapacity(houseEditForm.getCapacity());
        house.setPostalCode(houseEditForm.getPostalCode());
        house.setAddress(houseEditForm.getAddress());
        house.setPhoneNumber(houseEditForm.getPhoneNumber());
                        
        houseRepository.save(house);
    }
    
    // UUIDを使って生成したファイル名を返す
    public String generateNewFileName(String fileName) {
        String[] fileNames = fileName.split("\\.");
        for (int i = 0; i < fileNames.length - 1; i++) {
            fileNames[i] = UUID.randomUUID().toString();
        }
        String hashedFileName = String.join(".", fileNames);
        return hashedFileName;
    }
    
    
    // 画像ファイルを指定したファイルにコピーする
    public void copyImageFile(MultipartFile imageFile, Path filePath) {
        try {
            Files.copy(imageFile.getInputStream(), filePath);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}