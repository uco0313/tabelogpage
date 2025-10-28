package com.example.samuraitravel.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.samuraitravel.entity.Favorite;
import com.example.samuraitravel.entity.House;
import com.example.samuraitravel.entity.Review;
import com.example.samuraitravel.entity.User;
import com.example.samuraitravel.form.ReservationInputForm;
import com.example.samuraitravel.repository.HouseRepository;
import com.example.samuraitravel.security.UserDetailsImpl;
import com.example.samuraitravel.service.FavoriteService;
import com.example.samuraitravel.service.HouseService;
import com.example.samuraitravel.service.ReviewService;

@Controller
@RequestMapping("/houses")
public class HouseController {
	private final HouseRepository houseRepository;
    private final ReviewService reviewService; // ★要件1: ReviewServiceの依存性注入
    private final FavoriteService favoriteService;  
    private final HouseService houseService;  

    
    public HouseController(HouseRepository houseRepository,HouseService houseService, ReviewService reviewService, FavoriteService favoriteService) {
        this.houseService = houseService;
        this.reviewService = reviewService;
        this.favoriteService = favoriteService;
        this.houseRepository = houseRepository;
    }
    
    @GetMapping
    public String index(@RequestParam(name = "keyword", required = false) String keyword,
                        @RequestParam(name = "area", required = false) String area,
                        @RequestParam(name = "price", required = false) Integer price,  
                        @RequestParam(name = "order", required = false) String order,
                        @PageableDefault(page = 0, size = 10, sort = "id", direction = Direction.ASC) Pageable pageable,
                        Model model) 
    {
        Page<House> housePage;
                
        if (keyword != null && !keyword.isEmpty()) {            
            if (order != null && order.equals("priceAsc")) {
                housePage = houseRepository.findByNameLikeOrAddressLikeOrderByPriceAsc("%" + keyword + "%", "%" + keyword + "%", pageable);
            } else {
                housePage = houseRepository.findByNameLikeOrAddressLikeOrderByCreatedAtDesc("%" + keyword + "%", "%" + keyword + "%", pageable);
            }            
        } else if (area != null && !area.isEmpty()) {            
            if (order != null && order.equals("priceAsc")) {
                housePage = houseRepository.findByAddressLikeOrderByPriceAsc("%" + area + "%", pageable);
            } else {
                housePage = houseRepository.findByAddressLikeOrderByCreatedAtDesc("%" + area + "%", pageable);
            }            
        } else if (price != null) {            
            if (order != null && order.equals("priceAsc")) {
                housePage = houseRepository.findByPriceLessThanEqualOrderByPriceAsc(price, pageable);
            } else {
                housePage = houseRepository.findByPriceLessThanEqualOrderByCreatedAtDesc(price, pageable);
            }            
        } else {            
            if (order != null && order.equals("priceAsc")) {
                housePage = houseRepository.findAllByOrderByPriceAsc(pageable);
            } else {
                housePage = houseRepository.findAllByOrderByCreatedAtDesc(pageable);   
            }            
        }                
        
        model.addAttribute("housePage", housePage);
        model.addAttribute("keyword", keyword);
        model.addAttribute("area", area);
        model.addAttribute("price", price); 
        model.addAttribute("order", order);
        
        return "houses/index";
    }
    
    // show()メソッドを要件通りに拡張
    @GetMapping("/{id}")
    public String show(@PathVariable(name = "id") Integer id,
                       @AuthenticationPrincipal UserDetailsImpl userDetailsImpl, // ★認証情報の追加
                       RedirectAttributes redirectAttributes, // ★エラーハンドリングのため追加
                       Model model) 
    {
        // getReferenceById(id) はIDが存在しない場合に例外を投げるため、
        // findById()やサービスを利用してOptionalで取得する方が安全ですが、
        // HouseRepositoryをそのまま利用するため、ひとまずgetReferenceById()の利用を避けてfindById()を使います。
        Optional<House> optionalHouse  = houseRepository.findById(id);

        if (optionalHouse.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessage", "民宿が存在しません。");
            return "redirect:/houses";
        }
        
        House house = optionalHouse.get();        
        boolean hasUserAlreadyReviewed = false; 
        Favorite favorite = null;        
        boolean isFavorite = false;
        
        if (userDetailsImpl != null) {
            User user = userDetailsImpl.getUser();
            // ★要件2-1: 指定したユーザーの、指定した民宿に対するレビュー投稿有無
            hasUserAlreadyReviewed = reviewService.hasUserAlreadyReviewed(house, user);           
            isFavorite = favoriteService.isFavorite(house, user);
            
            if (isFavorite) {
                favorite = favoriteService.findFavoriteByHouseAndUser(house, user);
            }    
        }  
        
        // ★要件2-2: 指定した民宿の最新レビュー6件
        List<Review> newReviews = reviewService.findTop6ReviewsByHouseOrderByCreatedAtDesc(house);        
        // ★要件2-3: 指定した民宿のレビュー件数
        long totalReviewCount = reviewService.countReviewsByHouse(house);          
        
        model.addAttribute("house", house);
        model.addAttribute("reservationInputForm", new ReservationInputForm());
        
        // ★要件2: 取得した3つのデータをModelへ受け渡し
        model.addAttribute("hasUserAlreadyReviewed", hasUserAlreadyReviewed);
        model.addAttribute("newReviews", newReviews);        
        model.addAttribute("totalReviewCount", totalReviewCount);  
        model.addAttribute("favorite", favorite);
        model.addAttribute("isFavorite", isFavorite);

        return "houses/show";
    }
}