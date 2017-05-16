# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# 新增 admin 帳號 - User #
if User.find_by(email: "admin@rails.com").nil?
  u = User.new
  u.name = "測試管理員"
  u.email = "admin@rails.com"
  u.password = "111111"
  u.password_confirmation = "111111"
  u.is_admin = true
  u.save
  puts "創建管理員*1"
else
  puts "已創建過此帳號，不重複新增。"
end

# 新增 user 帳號 - User #
if User.find_by(email: "user@rails.com").nil?
  u = User.new
  u.name = "測試管理員"
  u.email = "user@rails.com"
  u.password = "111111"
  u.password_confirmation = "111111"
  u.is_admin = true
  u.save
  puts "創建一般用戶*1"
else
  puts "已創建過此帳號，不重複新增。"
end

# 新增品牌 - Brand #
  Brand.create!(
  name: "物外設計",
  description: "
  見藐小微物，必細察其紋理，故時有物外之趣。

  物外設計是入世的品牌，一心一意認定東西之所以設計製作，無非是為了被好好使用；透過生活看見這座島嶼的人文與風景，用雙手栽植、日常生長、生命中茁壯。在喫飯、瞌睡、散步、閒談之間領略器物的良善與生活的況味。",
  remote_logo_url: ("http://i.imgur.com/Vo6mi0z.jpg")
  )

  Brand.create!(
  name: "CLASSICO",
  description: "
  CLASSICO 向復古經典致敬，使用有溫度的手工版料與機器半手工製作，極簡線條內外兼俱的完美姿態。更能展現自我獨特、風格的生活態度。每隻框板經過匠師潤飾後，氛圍更顯圓融，用料極為講究，炭黑的質感更是不在話下。",
  remote_logo_url: ("http://i.imgur.com/WXsooaC.jpg")
  )

  Brand.create!(
  name: "Tools to Liveby / 禮拜文房具",
  description: "
  在平凡中,發現不平凡的美

  禮拜文房具設計簡單美好的文書工具，期待改變大家桌上的風景，讓每天工作的好心情就從隨手使用的文具開始。",
  remote_logo_url: ("http://i.imgur.com/FtAAr9R.jpg")
  )

  Brand.create!(
  name: "EVERYDAY OBJECT",
  description: "
  如果今天你每一個類型的物品都只能選擇一個，那個東西就是你的 EVERYDAY OBJECT。

  EVERYDAY OBJECT認為 ，好的東西不用多，幾個設計出眾、容易搭配的物品，便可以陪伴我們很久，帶給我們滿足與自信。我們可以天天使用也不會感到厭煩，因為它總是跟我們搭配的很好。如果可以在每一個分類，都找到一兩個這樣的物品，我們便能在風格上找到了真正的自我。

  好品味無法定義，而 EVERYDAY 最重要使命，就是要幫大家設計出這樣的 EVERYDAY OBJECT。",
  remote_logo_url: ("http://i.imgur.com/bklYTrP.png")
  )


  Brand.create!(
  name: "阿原 YUAN",
  description: "
  阿原經營理念，是以「台灣原鄉品牌」概念，結合「土地倫理」及勞動力美學，從社區出發，強調對於土地自然環境的關懷。

  阿原以植物為師，遵依土地倫理，並徹底將青草藥的療瘉特性融入，研製出高比例天然的產品，經營品牌的同時也同樣經營人身健康、土地環保、社會公益，因為：共生才能永續，「做」才是力量。",
  remote_logo_url: ("http://i.imgur.com/7bq58j6.jpg")
  )

  puts "創建品牌*5"

# 新增類型 - Category #
  CategoryGroup.create!(
    name: "文具"
  )

  CategoryGroup.create!(
    name: "生活"
  )

  CategoryGroup.create!(
    name: "個人"
  )

  puts "創建類型*3"

# 新增分類 - Category #
  # 文具
  Category.create!(
    category_group_id: 1,
    name: "筆具"
  )

  Category.create!(
    category_group_id: 1,
    name: "紙本"
  )

  Category.create!(
    category_group_id: 1,
    name: "刀剪"
  )


  # 生活
  Category.create!(
    category_group_id: 2,
    name: "收納"
  )

  Category.create!(
    category_group_id: 2,
    name: "廚具"
  )

  Category.create!(
    category_group_id: 2,
    name: "日常"
  )


  # 個人
  Category.create!(
    category_group_id: 3,
    name: "手工眼鏡"
  )

  Category.create!(
    category_group_id: 3,
    name: "手工皮鞋"
  )

  Category.create!(
    category_group_id: 3,
    name: "提袋"
  )

  puts "創建類型*9"

# 新增商品 - Product #

  # 物外設計
  # 1
  Product.create!(
    name: "物外設計 - 露銅系列原子筆",
    description: "
    創造一支屬於你自己的筆吧！

    露銅系列 Brassing Series 全系列使用黃銅材質，並於產品表面進行特殊黑色烤漆處理，展現沉穩低調之質感。

    物外 ystudio 發展此系列的靈感，來自於古典相機。在手動相機的時代，銅製傳統相機即是質感保證與高級機種的代表，銅製相機經歷拍攝時間的累積，機身會產生露銅(brassing)的狀況。使用傳統相機的攝影愛好者，視露銅為豐富攝影經歷的象徵，因為露銅的產生在於拍攝時間的累積，可視為「時間在相機上所留下的自然痕跡」，而那痕跡只屬於使用者對於自身相機的種種拍攝記憶，因此深受攝影愛好者所稱道。

    取此意義，物外 ystudio 在注重使用者與物件之間的關係，致力於使用者透過書寫而與他人產生情感鏈結的努力之外，也更尋求為您提供一個前所未有的文具使用經驗，創造專屬自己的文具用品。
    ",
    price: 2200,
    quantity: 2,
    category_id: 1,
    brand_id: 1,
    is_hidden: false
  )

  # 2
  Product.create!(
    name: "物外設計 - 黃銅文具系列有蓋鋼珠筆",
    description: "
    鋼珠筆精心配置適切的重量，在書寫時的手感流暢而沉穩。兼具美感與實用性，使用最優良之素材，期許成為使用一輩子之文具產品。

    銅材會因使用者與環境的變化，氧化出獨特的效果。氧化銅是無害的，使用銅油反復擦拭，即可恢復原來之光澤。
    ",
    price: 2800,
    quantity: 5,
    category_id: 1,
    brand_id: 1,
    is_hidden: false
  )

  # CLASSICO
  # 3
  Product.create!(
    name: "CLASSICO - NO.V2",
    description: "V2 的靈感來自於復古速克達 P 系列的拙實感。在上方下圓的融合之中。能夠切確的感受到圓滑。方形之中帶有一絲圓角。圓潤中卻連接方形，彷彿回到過去的手製年代。樸拙善良，令人簡單的喜愛。",
    price: 7000,
    quantity: 5,
    category_id: 7,
    brand_id: 2,
    is_hidden: false
  )

  # Tools to Liveby / 禮拜文房具
  # 4
  Product.create!(
    name: "Tools to Liveby - 圓把剪刀 (黑)",
    description: "
    使用日本不鏽鋼製造， 比例及造型都是最好的首選。自製的貼心小包裝，能保護刀刃，也以雷射雕刻了禮拜的 logo ，更適合當作禮物送給朋友。 同樣有霧黑與金色兩款，黑色款外層塗布一層鐵氟龍，裁剪膠帶時較不容易殘膠。附紙套包裝。
    ",
    price: 560,
    quantity: 10,
    category_id: 3,
    brand_id: 3,
    is_hidden: false
  )

  # 5
  Product.create!(
    name: "Tools to Liveby 隨行袋 (L)",
    description: "
    《禮拜文房具》新款隨行袋，比曾經推出過的所有袋子尺寸更大了些，可舒適地手提也可帥氣地肩背，有深藍色與米白色兩款。隨行袋內側另有一個小口袋，可放置小物件，使用起來更加方便，逛街購物或隨時來個小旅行，都非常實用，是生活中的必備單品。
    ",
    price: 450,
    quantity: 20,
    category_id: 9,
    brand_id: 3,
    is_hidden: false
  )

  # 6
  Product.create!(
    name: "Tools to Liveby 隨行袋 (S)",
    description: "
    《禮拜文房具》新推出的環保袋，此款袋型較小，可手提也可以斜肩揹，袋口部分有個黑色小扣子的設計，能夠保護袋內物品不易掉出。同樣是雙面圖案設計，一面是經典圖示，另一面印著我們很喜歡也一直是我們生活理念的 Quote - “Be refined, polite and well-spoken.” 。

    第一次選用藍色與灰色來製作，因為這兩種顏色給人沉穩且時尚的感覺，並且與我們日常生活的服飾容易搭配，很適合微旅行使用。
    ",
    price: 450,
    quantity: 20,
    category_id: 9,
    brand_id: 3,
    is_hidden: false
  )

  # 7
  Product.create!(
    name: "Tools to Liveby 手提肩揹兩用環保袋",
    description: "
    這一款我們自己稱它為「文青袋」，樣式比較中性，尺寸也大上許多！除了可以手提之外，側邊車縫了一條較長的揹帶，內容物太重時可肩揹。雙面的圖案設計，一面是禮拜文房具的經典圖標，另一面是插畫與文字設計。較薄的布料材質，方便平時收納在包包裡，外出或購物時取出使用。
    ",
    price: 300,
    quantity: 20,
    category_id: 9,
    brand_id: 3,
    is_hidden: false
  )

  puts "創建商品*7"
