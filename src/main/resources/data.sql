-- #################################
-- 1. categories テーブル
-- #################################
INSERT IGNORE INTO categories (id, name) VALUES (1, '和食');
INSERT IGNORE INTO categories (id, name) VALUES (2, 'イタリアン');
INSERT IGNORE INTO categories (id, name) VALUES (3, '中華');
INSERT IGNORE INTO categories (id, name) VALUES (4, 'カフェ');
INSERT IGNORE INTO categories (id, name) VALUES (5, 'その他');

-- #################################
-- 2. members テーブル
-- #################################
INSERT IGNORE INTO members (id, name, email, password_hash, postal_code, address, phone_number) 
VALUES (1, '山田太郎', 'yamada.t@example.com', '$2a$10$XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', '100-0001', '東京都千代田区', '090-1111-2222');
INSERT IGNORE INTO members (id, name, email, password_hash, postal_code, address, phone_number) 
VALUES (2, '佐藤花子', 'sato.h@example.com', '$2a$10$YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY', '220-0012', '神奈川県横浜市', '080-3333-4444');
INSERT IGNORE INTO members (id, name, email, password_hash, postal_code, address, phone_number) 
VALUES (3, '田中一郎', 'tanaka.i@example.com', '$2a$10$ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ', '530-0001', '大阪府大阪市', '070-5555-6666');

-- #################################
-- 3. admin テーブル
-- #################################
INSERT IGNORE INTO admin (id, email, password_hash) 
VALUES (1, 'admin@example.com', '$2a$10$AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');

-- #################################
-- 4. companies テーブル
-- #################################
INSERT IGNORE INTO companies (id, company_name, representative_name, establishment_date, postal_code, address, business_details)
VALUES (1, '食ログ株式会社', '代表取締役 鈴木', '2010-04-01', '150-0043', '東京都渋谷区道玄坂1-1-1', '飲食店の情報提供サービス事業');

-- #################################
-- 5. stores テーブル
-- #################################
INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (1, 1, '銀座 匠の寿司', 'sushixxx.jpg', '厳選された旬の魚を提供する高級寿司店。', 10000, 20000, '17:00:00', '22:00:00', '104-0061', '東京都中央区銀座1-2-3', '03-1234-5678', '月曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (2, 2, 'トラットリア・リッコ', 'italianxxx.jpg', '本格的な南イタリア料理を楽しめるアットホームな店。', 3000, 6000, '18:00:00', '23:00:00', '106-0032', '東京都港区六本木4-5-6', '03-9876-5432', '日曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (3, 3, '中華料理 龍鳳', 'chinaxxx.jpg', '四川料理をベースにした辛さと旨さが特徴の老舗。', 2000, 4000, '11:30:00', '21:00:00', '160-0023', '東京都新宿区西新宿7-8-9', '03-5555-4444', '無休');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (4, 4, 'ブックカフェ 木漏れ日', 'cafexxx.jpg', '静かな空間で読書を楽しめる隠れ家的カフェ。', 1000, 2000, '09:00:00', '18:00:00', '150-0002', '東京都渋谷区渋谷1-1-1', '03-3333-2222', '火曜日');

-- #################################
-- 6. review テーブル
-- #################################
-- 山田太郎（member_id=1）が銀座 匠の寿司（store_id=1）にレビュー
INSERT IGNORE INTO review (id, member_id, store_id, star_rating, comment)
VALUES (1, 1, 1, 5, '人生で一番美味しい寿司でした。大将の腕は本物です。');

-- 佐藤花子（member_id=2）がトラットリア・リッコ（store_id=2）にレビュー
INSERT IGNORE INTO review (id, member_id, store_id, star_rating, comment)
VALUES (2, 2, 2, 4, 'パスタが絶品！ワインも豊富でまた来たいです。');

-- 山田太郎（member_id=1）が中華料理 龍鳳（store_id=3）にレビュー
INSERT IGNORE INTO review (id, member_id, store_id, star_rating, comment)
VALUES (3, 1, 3, 3, '担々麺が美味しかったですが、少し辛すぎました。');


-- #################################
-- 7. reservation テーブル
-- #################################
-- 佐藤花子（member_id=2）が銀座 匠の寿司（store_id=1）に予約
INSERT IGNORE INTO reservation (id, member_id, store_id, reservation_date, number_of_people)
VALUES (1, 2, 1, '2025-11-15 19:30:00', 2);

-- 田中一郎（member_id=3）がトラットリア・リッコ（store_id=2）に予約
INSERT IGNORE INTO reservation (id, member_id, store_id, reservation_date, number_of_people)
VALUES (2, 3, 2, '2025-12-24 20:00:00', 4);




