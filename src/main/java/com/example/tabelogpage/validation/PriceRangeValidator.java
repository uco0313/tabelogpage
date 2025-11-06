package com.example.tabelogpage.validation; 

import com.example.tabelogpage.form.StoreEditForm;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;


public class PriceRangeValidator implements ConstraintValidator<PriceRange, StoreEditForm> { 

    private String message;
    

    @Override
    public void initialize(PriceRange constraintAnnotation) {
        this.message = constraintAnnotation.message();
    }

    @Override
    public boolean isValid(StoreEditForm form, ConstraintValidatorContext context) {
        
        // nullチェック
        if (form.getPriceMin() == null || form.getPriceMax() == null) {
            return true; // nullチェックは@NotNullに任せて、ここではtrueを返す
        }

        // 上限(priceMax)が下限(priceMin)以上であること
        boolean isValid = form.getPriceMax() >= form.getPriceMin();
        
        if (!isValid) {
            // エラーメッセージを表示するフィールドを指定（priceMaxに紐づける）
            context.disableDefaultConstraintViolation(); // デフォルトメッセージを無効化
        
            context.buildConstraintViolationWithTemplate(this.message) 
                   .addPropertyNode("priceMax") 
                   .addConstraintViolation();    
        }

        return isValid;
    }
}