package com.example.tabelogpage.entity;

import java.sql.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "review")
@Data
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id; 

    @Column(name = "member_id")
    private Integer memberId; // FK: 会員ID

    @Column(name = "store_id")
    private Integer storeId; // FK: 店舗ID

    @Column(name = "star_rating")
    private Integer starRating; // (TINYINT -> Integer)

    @Column(name = "comment")
    private String comment; // コメント (TEXT -> String)

    @Column(name = "created_at", insertable = false, updatable = false)
    private Timestamp createdAt; 

    @Column(name = "updated_at", insertable = false, updatable = false)
    private Timestamp updatedAt; 
}