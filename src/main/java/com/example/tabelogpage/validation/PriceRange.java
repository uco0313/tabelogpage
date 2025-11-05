package com.example.tabelogpage.validation; 

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

@Documented
@Constraint(validatedBy = { PriceRangeValidator.class }) 
@Target({ ElementType.TYPE }) // クラス全体に適用
@Retention(RetentionPolicy.RUNTIME)
public @interface PriceRange {
    
    
    String message() default "価格帯の上限は下限以上の値に設定してください。";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

}