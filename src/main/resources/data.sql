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
-- 5. stores テーブル (合計40件)
-- #################################
INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (1, 1, '銀座 匠の寿司', 'sushixxx.jpg', '厳選された旬の魚を提供する高級寿司店。', 10000, 20000, '17:00:00', '22:00:00', '450-0001', '愛知県名古屋市千種区銀座1-2-3', '052-1234-5678', '月曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (2, 2, 'トラットリア・リッコ', 'italianxxx.jpg', '本格的な南イタリア料理を楽しめるアットホームな店。', 3000, 6000, '18:00:00', '23:00:00', '450-0002', '愛知県名古屋市中村区六本木4-5-6', '052-9876-5432', '日曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (3, 3, '中華料理 龍鳳', 'chinaxxx.jpg', '四川料理をベースにした辛さと旨さが特徴の老舗。', 2000, 4000, '11:30:00', '21:00:00', '450-0003', '愛知県名古屋市中区西新宿7-8-9', '052-5555-4444', '無休');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (4, 4, 'ブックカフェ 木漏れ日', 'cafexxx.jpg', '静かな空間で読書を楽しめる隠れ家的カフェ。', 1000, 2000, '09:00:00', '18:00:00', '450-0004', '愛知県名古屋市中川区渋谷1-1-1', '052-3333-2222', '火曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (5, 1, '名駅前 海鮮問屋', 'sushi05.jpg', '新鮮な魚介をリーズナブルに提供。ランチも人気。', 4000, 8000, '11:00:00', '23:00:00', '450-0005', '愛知県名古屋市西区駅前3-1-1', '052-1234-5500', '水曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (6, 2, 'ピッツェリア 太陽', 'italian06.jpg', '石窯で焼く本格ナポリピッツァ専門店。', 2500, 4500, '17:30:00', '22:30:00', '450-0006', '愛知県名古屋市東区栄5-12-1', '052-9876-5501', '火曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (7, 3, '広東飯店 幸福', 'china07.jpg', '家族連れに人気の、あっさりとした広東料理。', 1500, 3500, '11:00:00', '21:30:00', '450-0007', '愛知県名古屋市北区丸の内2-8-3', '052-5555-4402', '木曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (8, 4, 'コーヒースタンド 雲', 'cafe08.jpg', '自家焙煎コーヒーと焼き菓子が楽しめる。', 800, 1500, '08:00:00', '17:00:00', '450-0008', '愛知県名古屋市南区港町1-4-7', '052-3333-2203', '金曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (9, 1, '寿司居酒屋 大漁', 'sushi09.jpg', '寿司と豊富な居酒屋メニューが楽しめる。', 3500, 7000, '17:00:00', '00:00:00', '450-0009', '愛知県名古屋市昭和区桜通6-2-2', '052-1111-9904', '無休');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (10, 2, 'リストランテ 月光', 'italian10.jpg', '夜景が見えるロマンチックな高級イタリアン。', 8000, 15000, '17:00:00', '23:00:00', '450-0010', '愛知県名古屋市瑞穂区星ヶ丘1-10', '052-8888-7705', '月曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (11, 3, '餃子専門店 満腹', 'china11.jpg', 'パリパリの羽付き餃子が自慢。', 1200, 2500, '11:00:00', '20:00:00', '450-0011', '愛知県名古屋市熱田区神宮3-5', '052-7777-6606', '水曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (12, 4, '抹茶と甘味処 和', 'cafe12.jpg', '伝統的な和菓子と抹茶を提供する専門店。', 900, 1800, '10:00:00', '18:00:00', '450-0012', '愛知県名古屋市中川区山王通4-1-1', '052-6666-5507', '火曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (13, 1, '回転寿司 鮮魚亭', 'sushi13.jpg', '家族で楽しめるリーズナブルな回転寿司。', 1500, 3000, '11:00:00', '22:00:00', '450-0013', '愛知県名古屋市港区大江町7-15', '052-4444-3308', '無休');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (14, 2, 'オステリア ドルチェ', 'italian14.jpg', '手打ちパスタと種類豊富なデザートが人気。', 4500, 7500, '18:00:00', '23:00:00', '450-0014', '愛知県名古屋市天白区植田西3-8', '052-2222-1109', '木曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (15, 3, '四川麻婆 炎', 'china15.jpg', '本場仕込みの激辛麻婆豆腐が名物。', 2800, 5000, '17:00:00', '22:00:00', '450-0015', '愛知県名古屋市守山区小幡中2-1-1', '052-0000-0010', '日曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (16, 4, 'テラスカフェ 風', 'cafe16.jpg', '開放的なテラス席でブランチを楽しめる。', 1200, 2500, '09:30:00', '19:00:00', '450-0016', '愛知県名古屋市緑区大高町字平子38', '052-9999-8811', '月曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (17, 1, '高級天ぷら 葵', 'sushi17.jpg', '旬の食材を使った揚げたての天ぷらを提供。', 9000, 18000, '17:30:00', '22:00:00', '450-0017', '愛知県名古屋市中区錦3-1-1', '052-1234-0012', '火曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (18, 2, '地中海レストラン 青空', 'italian18.jpg', '魚介類を中心とした地中海料理レストラン。', 5000, 9000, '18:00:00', '23:30:00', '450-0018', '愛知県名古屋市熱田区金山町1-1-1', '052-9876-0013', '水曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (19, 3, '上海小籠包 匠', 'china19.jpg', 'ジューシーな小籠包と点心が人気。', 2500, 4500, '11:00:00', '21:00:00', '450-0019', '愛知県名古屋市昭和区広路町8-8', '052-5555-0014', '木曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (20, 4, '古民家喫茶 山里', 'cafe20.jpg', 'レトロな雰囲気の古民家で静かに過ごせる。', 700, 1300, '10:00:00', '16:00:00', '450-0020', '愛知県名古屋市瑞穂区弥富通1-10', '052-3333-0015', '金曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (21, 1, 'うなぎ処 蓬来軒', 'sushi21.jpg', '名古屋名物のひつまぶしを堪能できる老舗。', 6000, 12000, '11:00:00', '20:30:00', '450-0021', '愛知県名古屋市千種区覚王山通8-10', '052-1111-0016', '月曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (22, 2, 'トラットリア フォルテ', 'italian22.jpg', '陽気な雰囲気でワインと料理が楽しめる店。', 3500, 6500, '18:00:00', '23:00:00', '450-0022', '愛知県名古屋市中村区則武1-1-1', '052-8888-0017', '火曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (23, 3, '本場香港麺専門店', 'china23.jpg', 'あっさりとしたスープと細麺が特徴の香港麺。', 1000, 2000, '11:00:00', '20:00:00', '450-0023', '愛知県名古屋市中区大須3-1-1', '052-7777-0018', '水曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (24, 4, 'パンケーキ専門店 幸せ', 'cafe24.jpg', 'ふわふわのパンケーキがSNSで話題。', 1500, 3000, '10:00:00', '19:00:00', '450-0024', '愛知県名古屋市北区金城1-5-1', '052-6666-0019', '木曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (25, 1, '炉端焼き 漁火', 'sushi25.jpg', '新鮮な魚介を炉端焼きで提供する居酒屋。', 4500, 8500, '17:00:00', '00:00:00', '450-0025', '愛知県名古屋市西区栄生3-2-2', '052-4444-0020', '無休');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (26, 2, 'イタリアンバル 絆', 'italian26.jpg', '気軽に立ち寄れるイタリアンバール。タパスが充実。', 2000, 4000, '17:00:00', '01:00:00', '450-0026', '愛知県名古屋市東区筒井3-1-1', '052-2222-0021', '日曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (27, 3, '台湾ラーメン 味仙', 'china27.jpg', '名古屋名物台湾ラーメンの元祖。激辛が人気。', 1200, 2500, '18:00:00', '02:00:00', '450-0027', '愛知県名古屋市昭和区御器所1-1-1', '052-0000-0022', '月曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (28, 4, 'ブック＆カフェ 思考', 'cafe28.jpg', '専門書と静かな読書スペースを提供。', 1000, 2000, '09:00:00', '20:00:00', '450-0028', '愛知県名古屋市南区呼続4-1-1', '052-9999-0023', '水曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (29, 1, 'おでん専門店 暖', 'sushi29.jpg', '冬場に嬉しい、優しい出汁のおでん。', 3000, 5000, '17:00:00', '23:00:00', '450-0029', '愛知県名古屋市瑞穂区高田町1-1-1', '052-1234-0024', '火曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (30, 2, 'ワイン食堂 ソレイユ', 'italian30.jpg', '自然派ワインと創作イタリアンが楽しめる。', 4000, 7000, '18:00:00', '00:00:00', '450-0030', '愛知県名古屋市熱田区六野1-1-1', '052-9876-0025', '木曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (31, 3, '本格中華 百楽', 'china31.jpg', '接待にも使える高級感のある本格中華。', 5000, 10000, '17:00:00', '22:00:00', '450-0031', '愛知県名古屋市中川区八田町4-1-1', '052-5555-0026', '金曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (32, 4, '隠れ家紅茶専門店', 'cafe32.jpg', '世界中の紅茶と優雅なティータイム。', 1800, 3500, '11:00:00', '18:00:00', '450-0032', '愛知県名古屋市港区入場町1-1-1', '052-3333-0027', '土曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (33, 1, '寿司割烹 粋', 'sushi33.jpg', '会席料理も楽しめる、落ち着いた雰囲気の寿司割烹。', 12000, 30000, '17:00:00', '21:00:00', '450-0033', '愛知県名古屋市天白区原1-1-1', '052-1111-0028', '月曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (34, 2, 'イタリア食堂 マンマ', 'italian34.jpg', 'お母さんの味を再現した温かい家庭料理。', 2000, 4000, '11:30:00', '20:00:00', '450-0034', '愛知県名古屋市守山区廿軒家1-1-1', '052-8888-0029', '水曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (35, 3, '中華粥 優しい味', 'china35.jpg', '朝食にもぴったりの、胃に優しい中華粥。', 800, 1500, '08:00:00', '14:00:00', '450-0035', '愛知県名古屋市緑区鹿山1-1-1', '052-7777-0030', '火曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (36, 4, 'カフェ レトロ館', 'cafe36.jpg', '大正ロマンを感じるアンティーク調のカフェ。', 900, 1800, '10:00:00', '18:00:00', '450-0036', '愛知県名古屋市中区丸の内3-1-1', '052-6666-0031', '木曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (37, 1, '焼鳥と日本酒 鶏次郎', 'sushi37.jpg', '新鮮な鶏を使った焼鳥と豊富な地酒。', 3500, 6000, '17:00:00', '23:00:00', '450-0037', '愛知県名古屋市熱田区桜田町1-1-1', '052-4444-0032', '金曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (38, 2, 'パスタ専門店 麺工房', 'italian38.jpg', '豊富な種類のソースと手打ち生パスタ。', 1500, 3500, '11:00:00', '21:00:00', '450-0038', '愛知県名古屋市昭和区八事本町1-1-1', '052-2222-0033', '日曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (39, 3, '薬膳火鍋 健康美', 'china39.jpg', '美容と健康を意識した薬膳スープの火鍋。', 4000, 8000, '17:30:00', '22:30:00', '450-0039', '愛知県名古屋市瑞穂区中山町1-1-1', '052-0000-0034', '月曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (40, 4, 'スムージー＆ジュースバー', 'cafe40.jpg', '新鮮な野菜と果物を使ったデトックスドリンク。', 700, 1500, '08:30:00', '19:30:00', '450-0040', '愛知県名古屋市熱田区伝馬1-1-1', '052-9999-0035', '水曜日');


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




