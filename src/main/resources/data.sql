-- #################################
-- 1. categories テーブル
-- #################################
INSERT IGNORE INTO categories (id, name) VALUES (1, '和食 Japanese food');
INSERT IGNORE INTO categories (id, name) VALUES (2, 'イタリアン Italian food');
INSERT IGNORE INTO categories (id, name) VALUES (3, '中華 Chinese food');
INSERT IGNORE INTO categories (id, name) VALUES (4, 'カフェ Cafe');
INSERT IGNORE INTO categories (id, name) VALUES (5, 'エスニック Ethnic food');
INSERT IGNORE INTO categories (id, name) VALUES (6, 'その他 Others');


-- #################################
-- 2. members テーブル
-- #################################
INSERT IGNORE INTO members (id, name, email, password_hash, postal_code, address, phone_number) 
VALUES (1, '佐藤 太郎', 'taro.sato@example.com', '$2a$10$2JNjTwZBwo7fprL2X4sv.OEKqxnVtsVQvuXDkI8xVGix.U3W5B7CO', '460-0003', '愛知県名古屋市中区錦1-1-1', '090-1234-5678');
INSERT IGNORE INTO members (id, name, email, password_hash, postal_code, address, phone_number) 
VALUES (2, '鈴木 花子', 'hanako.suzuki@example.com', '$2a$10$2JNjTwZBwo7fprL2X4sv.OEKqxnVtsVQvuXDkI8xVGix.U3W5B7CO', '450-0002', '愛知県名古屋市中村区名駅4-27-1', '090-1234-5678');
INSERT IGNORE INTO members (id, name, email, password_hash, postal_code, address, phone_number) 
VALUES (3, '高橋 義勝', 'yoshikatsu.takahashi@example.com', '$2a$10$2JNjTwZBwo7fprL2X4sv.OEKqxnVtsVQvuXDkI8xVGix.U3W5B7CO', '444-0044', '愛知県岡崎市康生通西4-71', '090-1234-5678');

-- #################################
-- 3. admin テーブル
-- #################################
INSERT IGNORE INTO admin (id, email, password_hash) 
VALUES (1, 'admin@example.com', '$2a$10$AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');

-- #################################
-- 4. companies テーブル
-- #################################
INSERT IGNORE INTO companies (id, company_name, representative_name, establishment_date, postal_code, address, business_details)
VALUES (1, 'tabelog株式会社', '代表取締役 北村　美桜', '2010-04-01', '150-0043', '東京都渋谷区道玄坂1-1-1', '飲食店の情報提供サービス事業');

-- #################################
-- 5. stores テーブル 
-- #################################
INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (1, 1, '銀座 匠の寿司', 'store001.jpg', '厳選された旬の魚を提供する高級寿司店。', 10000, 20000, '17:00:00', '22:00:00', '450-0001', '愛知県名古屋市千種区銀座1-2-3', '052-1234-5678', '月曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (2, 2, 'トラットリア・リッコ', 'store002.jpg', '本格的な南イタリア料理を楽しめるアットホームな店。', 3000, 6000, '18:00:00', '23:00:00', '450-0002', '愛知県名古屋市中村区六本木4-5-6', '052-9876-5432', '日曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (3, 3, '中華料理 龍鳳', 'store003.jpg', '四川料理をベースにした辛さと旨さが特徴の老舗。', 2000, 4000, '11:30:00', '21:00:00', '450-0003', '愛知県名古屋市中区西新宿7-8-9', '052-5555-4444', '無休');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (4, 4, 'Book Cafe moumou', 'store004.jpg', '静かな空間で読書を楽しめる隠れ家的カフェ。', 1000, 2000, '09:00:00', '18:00:00', '450-0004', '愛知県名古屋市中川区渋谷1-1-1', '052-3333-2222', '火曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (5, 1, '名駅前 海鮮問屋', 'store005.jpg', '新鮮な魚介をリーズナブルに提供。ランチも人気。', 4000, 8000, '11:00:00', '23:00:00', '450-0005', '愛知県名古屋市西区駅前3-1-1', '052-1234-5500', '水曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (6, 2, 'ピッツェリア・ロー二', 'store006.jpg', '石窯で焼く本格ナポリピッツァ専門店。', 2500, 4500, '17:30:00', '22:30:00', '450-0006', '愛知県名古屋市東区栄5-12-1', '052-9876-5501', '火曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (7, 3, '広東飯店 口福', 'store007.jpg', '家族連れに人気の、あっさりとした広東料理。', 1500, 3500, '11:00:00', '21:30:00', '450-0007', '愛知県名古屋市北区丸の内2-8-3', '052-5555-4402', '木曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (8, 4, 'COFFEEEEEE', 'store008.jpg', '自家焙煎コーヒーと焼き菓子が楽しめる。', 800, 1500, '08:00:00', '17:00:00', '450-0008', '愛知県名古屋市南区港町1-4-7', '052-3333-2203', '金曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (9, 1, '寿司居酒屋 大漁', 'store009.jpg', '寿司と豊富な居酒屋メニューが楽しめる。', 3500, 7000, '17:00:00', '00:00:00', '450-0009', '愛知県名古屋市昭和区桜通6-2-2', '052-1111-9904', '無休');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (10, 2, 'リストランテ 月と星', 'store010.jpg', '夜景が見えるロマンチックな高級イタリアン。', 8000, 15000, '17:00:00', '23:00:00', '450-0010', '愛知県名古屋市瑞穂区星ヶ丘1-10', '052-8888-7705', '月曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (11, 3, '餃子専門店 チャンソン', 'store011.jpg', 'パリパリの羽付き餃子が自慢。', 1200, 2500, '11:00:00', '20:00:00', '450-0011', '愛知県名古屋市熱田区神宮3-5', '052-7777-6606', '水曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (12, 4, '抹茶と甘味処 nagi', 'store012.jpg', '伝統的な和菓子と抹茶を提供する専門店。', 900, 1800, '10:00:00', '18:00:00', '450-0012', '愛知県名古屋市中川区山王通4-1-1', '052-6666-5507', '火曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (13, 1, '回転寿司 鮮魚亭', 'store013.jpg', '家族で楽しめるリーズナブルな回転寿司。', 1500, 3000, '11:00:00', '22:00:00', '450-0013', '愛知県名古屋市港区大江町7-15', '052-4444-3308', '無休');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (14, 2, 'オステリア ドルチェ', 'store014.jpg', '手打ちパスタと種類豊富なデザートが人気。', 4500, 7500, '18:00:00', '23:00:00', '450-0014', '愛知県名古屋市天白区植田西3-8', '052-2222-1109', '木曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (15, 3, '四川麻婆 炎', 'store015.jpg', '本場仕込みの激辛麻婆豆腐が名物。', 2800, 5000, '17:00:00', '22:00:00', '450-0015', '愛知県名古屋市守山区小幡中2-1-1', '052-0000-0010', '日曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (16, 4, 'terrace moon', 'store016.jpg', '開放的なテラス席でブランチを楽しめる。', 1200, 2500, '09:30:00', '19:00:00', '450-0016', '愛知県名古屋市緑区大高町字平子38', '052-9999-8811', '月曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (17, 1, '高級天ぷら 葵', 'store017.jpg', '旬の食材を使った揚げたての天ぷらを提供。', 9000, 18000, '17:30:00', '22:00:00', '450-0017', '愛知県名古屋市中区錦3-1-1', '052-1234-0012', '火曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (18, 2, '地中海レストラン Baro', 'store018.jpg', '魚介類を中心とした地中海料理レストラン。', 5000, 9000, '18:00:00', '23:30:00', '450-0018', '愛知県名古屋市熱田区金山町1-1-1', '052-9876-0013', '水曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (19, 3, '上海小籠包 匠', 'store019.jpg', 'ジューシーな小籠包と点心が人気。', 2500, 4500, '11:00:00', '21:00:00', '450-0019', '愛知県名古屋市昭和区広路町8-8', '052-5555-0014', '木曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (20, 4, '古民家喫茶 コテジ', 'store020.jpg', 'レトロな雰囲気の古民家で静かに過ごせる。', 700, 1300, '10:00:00', '16:00:00', '450-0020', '愛知県名古屋市瑞穂区弥富通1-10', '052-3333-0015', '金曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (21, 1, 'うなぎ処 蓬来軒', 'store021.jpg', '名古屋名物のひつまぶしを堪能できる老舗。', 6000, 12000, '11:00:00', '20:30:00', '450-0021', '愛知県名古屋市千種区覚王山通8-10', '052-1111-0016', '月曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (22, 2, 'トラットリア フォルテ', 'store022.jpg', '陽気な雰囲気でワインと料理が楽しめる店。', 3500, 6500, '18:00:00', '23:00:00', '450-0022', '愛知県名古屋市中村区則武1-1-1', '052-8888-0017', '火曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (23, 3, '本場香港麺専門店', 'store023.jpg', 'あっさりとしたスープと細麺が特徴の香港麺。', 1000, 2000, '11:00:00', '20:00:00', '450-0023', '愛知県名古屋市中区大須3-1-1', '052-7777-0018', '水曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (24, 4, 'pancake tabetai', 'store024.jpg', 'ふわふわのパンケーキがSNSで話題。', 1500, 3000, '10:00:00', '19:00:00', '450-0024', '愛知県名古屋市北区金城1-5-1', '052-6666-0019', '木曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (25, 1, '炉端焼き 漁火', 'store025.jpg', '新鮮な魚介を炉端焼きで提供する居酒屋。', 4500, 8500, '17:00:00', '00:00:00', '450-0025', '愛知県名古屋市西区栄生3-2-2', '052-4444-0020', '無休');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (26, 2, 'イタリアンバル ', 'store026.jpg', '気軽に立ち寄れるイタリアンバール。タパスが充実。', 2000, 4000, '17:00:00', '01:00:00', '450-0026', '愛知県名古屋市東区筒井3-1-1', '052-2222-0021', '日曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (27, 3, '台湾ラーメン 味仙', 'store027.jpg', '名古屋名物台湾ラーメンの元祖。激辛が人気。', 1200, 2500, '18:00:00', '02:00:00', '450-0027', '愛知県名古屋市昭和区御器所1-1-1', '052-0000-0022', '月曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (28, 4, 'book book cafe', 'store028.jpg', '専門書と静かな読書スペースを提供。', 1000, 2000, '09:00:00', '20:00:00', '450-0028', '愛知県名古屋市南区呼続4-1-1', '052-9999-0023', '水曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (29, 1, 'おでん専門店 暖', 'store029.jpg', '冬場に嬉しい、優しい出汁のおでん。', 3000, 5000, '17:00:00', '23:00:00', '450-0029', '愛知県名古屋市瑞穂区高田町1-1-1', '052-1234-0024', '火曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (30, 2, 'ワイン食堂 ソレイユ', 'store030.jpg', '自然派ワインと創作イタリアンが楽しめる。', 4000, 7000, '18:00:00', '00:00:00', '450-0030', '愛知県名古屋市熱田区六野1-1-1', '052-9876-0025', '木曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (31, 3, '本格中華 百楽', 'store031.jpg', '接待にも使える高級感のある本格中華。', 5000, 10000, '17:00:00', '22:00:00', '450-0031', '愛知県名古屋市中川区八田町4-1-1', '052-5555-0026', '金曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (32, 4, '隠れ家紅茶専門店', 'store032.jpg', '世界中の紅茶と優雅なティータイム。', 1800, 3500, '11:00:00', '18:00:00', '450-0032', '愛知県名古屋市港区入場町1-1-1', '052-3333-0027', '土曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (33, 1, '寿司割烹 粋', 'store033.jpg', '会席料理も楽しめる、落ち着いた雰囲気の寿司割烹。', 12000, 30000, '17:00:00', '21:00:00', '450-0033', '愛知県名古屋市天白区原1-1-1', '052-1111-0028', '月曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (34, 2, 'イタリア食堂 マンマ', 'store034.jpg', 'お母さんの味を再現した温かい家庭料理。', 2000, 4000, '11:30:00', '20:00:00', '450-0034', '愛知県名古屋市守山区廿軒家1-1-1', '052-8888-0029', '水曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (35, 3, '中華粥 優', 'store035.jpg', '朝食にもぴったりの、胃に優しい中華粥。', 800, 1500, '08:00:00', '14:00:00', '450-0035', '愛知県名古屋市緑区鹿山1-1-1', '052-7777-0030', '火曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (36, 4, 'カフェ レトロ レトロ', 'store036.jpg', '大正ロマンを感じるアンティーク調のカフェ。', 900, 1800, '10:00:00', '18:00:00', '450-0036', '愛知県名古屋市中区丸の内3-1-1', '052-6666-0031', '木曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (37, 1, '焼鳥と日本酒 鶏次郎', 'store037.jpg', '新鮮な鶏を使った焼鳥と豊富な地酒。', 3500, 6000, '17:00:00', '23:00:00', '450-0037', '愛知県名古屋市熱田区桜田町1-1-1', '052-4444-0032', '金曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (38, 2, 'パスタ専門店 麺工房', 'store038.jpg', '豊富な種類のソースと手打ち生パスタ。', 1500, 3500, '11:00:00', '21:00:00', '450-0038', '愛知県名古屋市昭和区八事本町1-1-1', '052-2222-0033', '日曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (39, 3, '薬膳火鍋 健康美', 'store039.jpg', '美容と健康を意識した薬膳スープの火鍋。', 4000, 8000, '17:30:00', '22:30:00', '450-0039', '愛知県名古屋市瑞穂区中山町1-1-1', '052-0000-0034', '月曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (40, 4, 'Smoothie smoothie', 'store040.jpg', '新鮮な野菜と果物を使ったデトックスドリンク。', 700, 1500, '08:30:00', '19:30:00', '450-0040', '愛知県名古屋市熱田区伝馬1-1-1', '052-9999-0035', '水曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (41, 1, '自然派和食 結', 'store041.jpg', '無農薬野菜と出汁にこだわった健康的な定食屋。', 1500, 3000, '11:00:00', '21:00:00', '450-0041', '愛知県名古屋市千種区富士見台1-1-1', '052-1111-1111', '日曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (42, 4, 'オーガニックカフェ muku', 'store042.jpg', '無添加食材にこだわった、体に優しいカフェメニュー。', 1000, 2500, '09:00:00', '19:00:00', '450-0042', '愛知県名古屋市中村区大日町2-2-2', '052-2222-2222', '水曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (43, 3, '本場マーラータン 辛王', 'store043.jpg', 'カスタマイズできる具材が魅力の人気のマーラータン専門店。', 1200, 2800, '11:30:00', '22:00:00', '450-0043', '愛知県名古屋市中区栄3-3-3', '052-3333-3333', '無休');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (44, 4, 'アサイーボウル専門店 Lani', 'store044.jpg', '新鮮なフルーツとアサイーボウル、スムージーを提供。', 800, 1800, '10:00:00', '18:00:00', '450-0044', '愛知県名古屋市中川区山王1-4-4', '052-4444-4444', '火曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (45, 4, 'タピオカドリンク tappi', 'store045.jpg', '様々なフレーバーのタピオカドリンクが楽しめるスタンド。', 600, 1000, '12:00:00', '20:00:00', '450-0045', '愛知県名古屋市北区黒川本通5-5-5', '052-5555-5555', '月曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (46, 5, 'スパイスカレー ターメリック', 'store046.jpg', '日替わりスパイスカレーと副菜が人気の専門店。', 1200, 2500, '11:00:00', '15:00:00', '450-0046', '愛知県名古屋市昭和区川名本町1-1-1', '052-6666-6666', '火曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (47, 5, 'インドスパイスの王様', 'store047.jpg', '南インド風の本格的なミールスを提供するカレー屋。', 1500, 3000, '11:30:00', '21:30:00', '450-0047', '愛知県名古屋市西区上小田井2-2-2', '052-7777-7777', '月曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (48, 5, '欧風カレーといえば、ここ。', 'store048.jpg', '長時間煮込んだ濃厚なルーが特徴の欧風カレー専門店。', 1800, 3500, '11:00:00', '20:00:00', '450-0048', '愛知県名古屋市東区東桜4-4-4', '052-8888-8888', '無休');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (49, 5, 'カレーと酒場 ナマステ', 'store049.jpg', '夜は多国籍な一品料理とクラフトビールも楽しめる。', 1000, 4000, '17:00:00', '00:00:00', '450-0049', '愛知県名古屋市中区錦1-5-5', '052-9999-9999', '日曜日');

INSERT IGNORE INTO stores (id, category_id, store_name, image_path, description, price_min, price_max, opening_time, closing_time, postal_code, address, phone_number, regular_holiday)
VALUES (50, 5, 'マイルドカレー こぐま', 'store050.jpg', '子どもから大人まで楽しめる辛さ控えめの優しいカレー。', 900, 1800, '11:00:00', '19:00:00', '450-0050', '愛知県名古屋市瑞穂区弥富ヶ丘5-6-7', '052-1234-9876', '木曜日');

-- #################################
-- 6. review テーブル
-- #################################

-- ID 1 (佐藤太郎)が銀座 匠の寿司（store_id=1）にレビュー
INSERT IGNORE INTO review (id, member_id, store_id, star_rating, comment)
VALUES (1, 1, 1, 5, '人生で一番美味しい寿司でした！');

-- ID 2 (鈴木花子)がトラットリア・リッコ（store_id=2）にレビュー
INSERT IGNORE INTO review (id, member_id, store_id, star_rating, comment)
VALUES (2, 2, 2, 4, 'パスタが絶品！ワインも豊富でまた来たいです。');

-- ID 1 (佐藤太郎)が中華料理 龍鳳（store_id=3）にレビュー
INSERT IGNORE INTO review (id, member_id, store_id, star_rating, comment)
VALUES (3, 1, 3, 3, '担々麺が美味しかったです。辛党にお勧め！');

-- #################################
-- 7. roles テーブル
-- #################################
INSERT IGNORE INTO roles (id, name) 
VALUES (1, 'ROLE_GENERAL');

INSERT IGNORE INTO roles (id, name) 
VALUES (2, 'ROLE_ADMIN');

-- #################################
-- 8. users テーブル
-- #################################

-- ID 1: 佐藤 太郎 (ROLE_GENERAL) - レビューデータで使用
INSERT IGNORE INTO users (id, name, furigana, postal_code, address, phone_number, email, password, role_id, enabled) 
VALUES (1, '佐藤 太郎', 'サトウ タロウ', '460-0003', '愛知県名古屋市中区錦1-1-1', '090-1234-5678', 'taro.sato@example.com', '$2a$10$2JNjTwZBwo7fprL2X4sv.OEKqxnVtsVQvuXDkI8xVGix.U3W5B7CO', 1, true);

-- ID 2: 鈴木 花子 (ROLE_ADMIN) - レビューと予約データで使用
INSERT IGNORE INTO users (id, name, furigana, postal_code, address, phone_number, email, password, role_id, enabled) 
VALUES (2, '鈴木 花子', 'スズキ ハナコ', '450-0002', '愛知県名古屋市中村区名駅4-27-1', '090-1234-5678', 'hanako.suzuki@example.com', '$2a$10$2JNjTwZBwo7fprL2X4sv.OEKqxnVtsVQvuXDkI8xVGix.U3W5B7CO', 2, true);

-- ID 3: 高橋 義勝 (ROLE_GENERAL) - 予約データで使用
INSERT IGNORE INTO users (id, name, furigana, postal_code, address, phone_number, email, password, role_id, enabled) 
VALUES (3, '高橋 義勝', 'タカハシ ヨシカツ', '444-0044', '愛知県岡崎市康生通西4-71', '090-1234-5678', 'yoshikatsu.takahashi@example.com', '$2a$10$2JNjTwZBwo7fprL2X4sv.OEKqxnVtsVQvuXDkI8xVGix.U3W5B7CO', 1, false);

INSERT IGNORE INTO users (id, name, furigana, postal_code, address, phone_number, email, password, role_id, enabled) 
VALUES (4, '田中 幸美', 'タナカ サチミ', '440-0897', '愛知県豊橋市松葉町1-11', '090-1234-5678', 'sachimi.tanaka@example.com', '$2a$10$2JNjTwZBwo7fprL2X4sv.OEKqxnVtsVQvuXDkI8xVGix.U3W5B7CO', 1, false);

INSERT IGNORE INTO users (id, name, furigana, postal_code, address, phone_number, email, password, role_id, enabled) 
VALUES (5, '伊藤 雅', 'イトウ ミヤビ', '471-0025', '愛知県豊田市西町6-85-1', '090-1234-5678', 'miyabi.ito@example.com', '$2a$10$2JNjTwZBwo7fprL2X4sv.OEKqxnVtsVQvuXDkI8xVGix.U3W5B7CO', 1, false);

INSERT IGNORE INTO users (id, name, furigana, postal_code, address, phone_number, email, password, role_id, enabled) 
VALUES (6, '渡辺 正保', 'ワタナベ マサヤス', '491-0858', '愛知県一宮市栄3-1-2', '090-1234-5678', 'masayasu.watanabe@example.com', '$2a$10$2JNjTwZBwo7fprL2X4sv.OEKqxnVtsVQvuXDkI8xVGix.U3W5B7CO', 1, false);

INSERT IGNORE INTO users (id, name, furigana, postal_code, address, phone_number, email, password, role_id, enabled) 
VALUES (7, '山本 真由美', 'ヤマモト マユミ', '485-0041', '愛知県小牧市中央1-1', '090-1234-5678', 'mayumi.yamamoto@example.com', '$2a$10$2JNjTwZBwo7fprL2X4sv.OEKqxnVtsVQvuXDkI8xVGix.U3W5B7CO', 1, false);

INSERT IGNORE INTO users (id, name, furigana, postal_code, address, phone_number, email, password, role_id, enabled) 
VALUES (8, '中村 安民', 'ナカムラ ヤスタミ', '448-0858', '愛知県刈谷市大手町1-1', '090-1234-5678', 'yasutami.nakamura@example.com', '$2a$10$2JNjTwZBwo7fprL2X4sv.OEKqxnVtsVQvuXDkI8xVGix.U3W5B7CO', 1, false);

INSERT IGNORE INTO users (id, name, furigana, postal_code, address, phone_number, email, password, role_id, enabled) 
VALUES (9, '小林 章緒', 'コバヤシ アキオ', '446-0032', '愛知県安城市御幸本町1-1', '090-1234-5678', 'akio.kobayashi@example.com', '$2a$10$2JNjTwZBwo7fprL2X4sv.OEKqxnVtsVQvuXDkI8xVGix.U3W5B7CO', 1, false);

INSERT IGNORE INTO users (id, name, furigana, postal_code, address, phone_number, email, password, role_id, enabled) 
VALUES (10, '加藤 祐子', 'カトウ ユウコ', '470-2200', '愛知県知多郡阿久比町', '090-1234-5678', 'yuko.kato@example.com', '$2a$10$2JNjTwZBwo7fprL2X4sv.OEKqxnVtsVQvuXDkI8xVGix.U3W5B7CO', 1, false);

INSERT IGNORE INTO users (id, name, furigana, postal_code, address, phone_number, email, password, role_id, enabled) 
VALUES (11, '吉田 秋美', 'ヨシダ アキミ', '480-1121', '愛知県長久手市山越901', '090-1234-5678', 'akimi.yoshida@example.com', '$2a$10$2JNjTwZBwo7fprL2X4sv.OEKqxnVtsVQvuXDkI8xVGix.U3W5B7CO', 1, false);

INSERT IGNORE INTO users (id, name, furigana, postal_code, address, phone_number, email, password, role_id, enabled) 
VALUES (12, '山田 信平', 'ヤマダ シンペイ', '464-0802', '愛知県名古屋市千種区星ヶ丘元町15', '090-1234-5678', 'shinpei.yamada@example.com', '$2a$10$2JNjTwZBwo7fprL2X4sv.OEKqxnVtsVQvuXDkI8xVGix.U3W5B7CO', 1, false);



-- #################################
-- 9. reservation テーブル
-- #################################

-- 予約済みデータ 
INSERT IGNORE INTO reservation (id, member_id, store_id, reservation_date, number_of_people)
VALUES (1, 1, 1, '2025-11-15', 2);

INSERT IGNORE INTO reservation (id, member_id, store_id, reservation_date, number_of_people)
VALUES (2, 2, 2, '2025-12-24', 4);

INSERT IGNORE INTO reservation (id, member_id, store_id, reservation_date, number_of_people) 
VALUES (3, 3, 3, '2025-11-16', 3);

INSERT IGNORE INTO reservation (id, member_id, store_id, reservation_date, number_of_people) 
VALUES (4, 4, 4, '2025-12-25', 5);

INSERT IGNORE INTO reservation (id, member_id, store_id, reservation_date, number_of_people) 
VALUES (5, 5, 5, '2025-11-17', 2);

INSERT IGNORE INTO reservation (id, member_id, store_id, reservation_date, number_of_people) 
VALUES (6, 6, 6, '2025-12-26', 4);

INSERT IGNORE INTO reservation (id, member_id, store_id, reservation_date, number_of_people) 
VALUES (7, 7, 7, '2025-11-18', 3);

INSERT IGNORE INTO reservation (id, member_id, store_id, reservation_date, number_of_people) 
VALUES (8, 8, 8, '2025-12-27', 2);

INSERT IGNORE INTO reservation (id, member_id, store_id, reservation_date, number_of_people) 
VALUES (9, 9, 9, '2025-11-19', 5);

INSERT IGNORE INTO reservation (id, member_id, store_id, reservation_date, number_of_people) 
VALUES (10, 10, 10, '2025-12-28', 3);
