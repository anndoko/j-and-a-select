# This file should contain all the record creation needed to seed the database with its default values.
 # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
 #
 # Examples:
 #
 #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
 #   Character.create(name: 'Luke', movie: movies.first)

 # 新增 admin 帳號  User #
   if User.find_by(email: 'admin@rails.com').nil?
     u = User.new
     u.name = '測試管理員'
     u.email = 'admin@rails.com'
     u.nickname = '測試管理員'
     u.password = '111111'
     u.password_confirmation = '111111'
     u.is_admin = true
     u.save
     puts '創建管理員*1'
   else
     puts '已創建過此帳號，不重複新增。'
   end

   # 新增 user 帳號  User #
   if User.find_by(email: 'user@rails.com').nil?
     u = User.new
     u.name = '測試管理員'
     u.email = 'user@rails.com'
     u.nickname = '測試管理員'
     u.password = '111111'
     u.password_confirmation = '111111'
     u.is_admin = true
     u.save
     puts '創建一般用戶*1'
   else
     puts '已創建過此帳號，不重複新增。'
   end

 # 新增幣別  Currency #
   Currency.create!(
     name: '人民币',
     symbol: '¥',
     rate: 0.23
   )

   Currency.create!(
     name: '新台幣',
     symbol: 'NT$',
     rate: 1
   )

   Currency.create!(
     name: 'Euro',
     symbol: '€',
     rate: 0.03
   )

   Currency.create!(
     name: 'US Dollar',
     symbol: '$',
     rate: 0.03
   )

   Currency.create!(
     name: '日円',
     symbol: '¥',
     rate: 3.69
   )

   puts '創建初始幣別*5：人民幣、新台幣、歐元、美金、日圓'

 # 新增廣告  Intro #

   # 1
   Intro.create!(
     title: 'J&A SELECT',
     content: '講究生活裡細微的美好，就是我們的選物精神。',
     link: '#'
   )

   # 2
   Intro.create!(
     title: '桌上風景',
     content: '實用與美學兼具，重新定義你的辦公日常。',
     link: '#'
   )

   # 3
   Intro.create!(
     title: '生活質感',
     content: '讓風格成為日常的一部分。',
     link: '#'
   )

   # 4
   Intro.create!(
     title: '經典單品',
     content: '從隨身物件展露你的獨到品味',
     link: '#'
   )

   puts '創建廣告*4'

 # 新增類型  Category #
   CategoryGroup.create!(
     name: '日常文具'
   )

   CategoryGroup.create!(
     name: '生活器物'
   )

   CategoryGroup.create!(
     name: '個人單品'
   )

   puts '創建類型*3：日常文具、生活器物、個人單品'

 # 新增分類  Category #
   # 文具
   # 1
   Category.create!(
     category_group_id: 1,
     name: '筆具'
   )

   # 2
   Category.create!(
     category_group_id: 1,
     name: '筆袋'
   )

   # 3
   Category.create!(
     category_group_id: 1,
     name: '紙本'
   )

   # 4
   Category.create!(
     category_group_id: 1,
     name: '刀剪'
   )

   # 5
   Category.create!(
     category_group_id: 1,
     name: '尺規'
   )

   puts '創建「日常文具」分類*5：筆具、筆袋、紙本、刀剪、書籤'

   # 生活
   # 6
   Category.create!(
     category_group_id: 2,
     name: '收納'
   )

   # 7
   Category.create!(
     category_group_id: 2,
     name: '裝飾'
   )

   # 8
   Category.create!(
     category_group_id: 2,
     name: '器皿'
   )

   puts '創建「生活器物」分類*3：收納、裝飾、器皿'

   # 個人
   # 9
   Category.create!(
     category_group_id: 3,
     name: '提袋'
   )
   # 10
   Category.create!(
     category_group_id: 3,
     name: '皮件'
   )
   # 11
   Category.create!(
     category_group_id: 3,
     name: '小物'
   )

   puts '創建「個人單品」分類*3：提袋、皮件、小物'

 # 新增品牌  Brand #
   # 1 Tools to Liveby / 禮拜文房具
   Brand.create!(
   name: 'Tools to Liveby / 禮拜文房具',
   description: '
   在平凡中，發現不平凡的美

   禮拜文房具設計簡單美好的文書工具，期待改變大家桌上的風景，讓每天工作的好心情就從隨手使用的文具開始。'
   )

   # 2 Kaweco
   Brand.create!(
   name: 'Kaweco',
   description: '
   「體積雖小，但成就無限」是 Kaweco® 的創業精神精神標語。

   德國品牌 Kaweco 的設計理念恰恰符合了歐洲時下最流行的「極簡」，其中攜帶便利的短筆筆型為最具代表性的款式之一。'
   )

   # 3 RHODIA
   Brand.create!(
   name: 'RHODIA',
   description: '
   RHODIA 來自法國，筆記本紙感滑順，強調使用便利、高品質用紙，適用各種筆款墨水書寫。這樣的設計及用料堅持，讓 RHODIA 筆記本一直是許多歐美名人及設計師的最愛。'
   )

   # 4 BRAUN
   Brand.create!(
   name: 'BRAUN',
   description: '
   德國品牌 BRAUN 專注於提供人們所需要的產品功能，操作讓人一看到操作介面，就能立即上手。對於設計美感更是絲毫不妥協，線條俐落，每一個產品細節都完美展現簡單大方的設計美學。'
   )

   # 5
   Brand.create!(
   name: 'Midori',
   description: '來自日本的 Midori，創立於 1950 年，半個世紀以來，透過提供頂級紙製品，讓無數的人重新愛上書寫。'
   )

   # 6
   Brand.create!(
   name: 'Hightide',
   description: 'Hightide 是日本知名的文具公司，Hightide 相信文具能在我們的日常生活和工作中產生不同的影響，希望為大家提供質量高的文具，在情感和精神上都得到滿足。'
   )

   #7
   Brand.create!(
   name: 'Merchant & Mills',
   description: 'Merchant & Mills 創辦於 2010 年，旨在激勵人們對原始手工縫製的熱愛。他們擁有專業的時尚嗅覺，堅持用高品質的面料手工縫紉服裝。「手工縫製重新回歸了人們的視線，現在有關手工製作的所有事情都即將引發新的潮流。」。
   '
   )


   puts '創建品牌*6'
 

# 新增商品  Product #

  Product.create!(
    name: 'Tools to Liveby 手工皮革筆袋（大）',
    description: '
    天然植鞣皮革，會隨著時間與使用而逐漸產生色澤變化，隨著不同的使用者或是使用方式，會呈現不一樣的質感，這就是植鞣牛皮的迷人之處。
    ',
    price: 2500,
    quantity: 3,
    category_id: 2,
    brand_id: 1,
    is_hidden: false
  )

  Product.create!(
    name: 'Tools to Liveby X Vita Yang 明信片組',
    description: '
    Vita Yang，知名時尚插畫家。作品常見於 Harvey Nichols、HUMAN MADE、agnès b 等知名品牌，並長期與巴西 Vogue 雜誌合作。

    禮拜文房具首度與時尚插畫家 Vita Yang 推出聯名商品。以〈 7 DAYS 7 BOYS〉為主題，延伸出7個品項，10款限定商品，每樣都值得收藏!
    ',
    price: 300,
    quantity: 5,
    category_id: 3,
    brand_id: 1,
    is_hidden: false
  )

  Product.create!(
    name: 'Tools to Liveby  圓把剪刀（黑）',
    description: '
    使用日本不鏽鋼製造， 比例及造型都是最好的首選。自製的貼心小包裝，能保護刀刃，也以雷射雕刻了禮拜的 logo ，更適合當作禮物送給朋友。 同樣有霧黑與金色兩款，黑色款外層塗布一層鐵氟龍，裁剪膠帶時較不容易殘膠。附紙套包裝。
    ',
    price: 560,
    quantity: 10,
    category_id: 4,
    brand_id: 1,
    is_hidden: false
  )

  Product.create!(
    name: 'Tools to Liveby 復古拆信刀',
    description: '
    現在比較少人有使用拆信刀的習慣，但是建議大家不妨從這款平價的入門試試看，讓自己的步調放慢下來，去感受工具為生活所帶來的樂趣。使用方式:拇指與中指輕握拆信刀邊緣，食指輕壓刀刃，刀刃尖端可在信封背面封口一角挑出小缺孔，即可順勢劃開封口。
    ',
    price: 45,
    quantity: 10,
    category_id: 4,
    brand_id: 1,
    is_hidden: false
  )

  Product.create!(
    name: 'Tools to Liveby 隨行袋（L）',
    description: '
    《禮拜文房具》新款隨行袋，比曾經推出過的所有袋子尺寸更大了些，可舒適地手提也可帥氣地肩背，有深藍色與米白色兩款。隨行袋內側另有一個小口袋，可放置小物件，使用起來更加方便，逛街購物或隨時來個小旅行，都非常實用，是生活中的必備單品。
    ',
    price: 450,
    quantity: 15,
    category_id: 9,
    brand_id: 1,
    is_hidden: false
  )

  Product.create!(
    name: 'Tools to Liveby 隨行袋（S）',
    description: '
    《禮拜文房具》新推出的環保袋，此款袋型較小，可手提也可以斜肩揹，袋口部分有個黑色小扣子的設計，能夠保護袋內物品不易掉出。同樣是雙面圖案設計，一面是經典圖示，另一面印著我們很喜歡也一直是我們生活理念的 Quote  “Be refined, polite and wellspoken.” 。

    第一次選用藍色與灰色來製作，因為這兩種顏色給人沉穩且時尚的感覺，並且與我們日常生活的服飾容易搭配，很適合微旅行使用。
    ',
    price: 450,
    quantity: 8,
    category_id: 9,
    brand_id: 1,
    is_hidden: false
  )

  Product.create!(
    name: 'Tools to Liveby 手提肩揹兩用環保袋',
    description: '
    這一款我們自己稱它為「文青袋」，樣式比較中性，尺寸也大上許多！除了可以手提之外，側邊車縫了一條較長的揹帶，內容物太重時可肩揹。雙面的圖案設計，一面是禮拜文房具的經典圖標，另一面是插畫與文字設計。較薄的布料材質，方便平時收納在包包裡，外出或購物時取出使用。
    ',
    price: 300,
    quantity: 20,
    category_id: 9,
    brand_id: 1,
    is_hidden: false
  )

  Product.create!(
    name: 'Kaweco Liliput 迷你手帳型原子筆（平面）',
    description: '
    2014年的新商品，德國 KAWECO Liliput 迷你手帳型原子筆，以耐久耐用的黃銅材質所製作，總長度僅有9.6cm，黃銅筆身握在手裡溫潤的觸感讓人愛不釋手！

    貼心提醒：
    黃銅材質表面與空氣接觸後氧化屬於正常現象，保養以銅油擦拭即可恢復原本光澤。
    ',
    price: 2500,
    quantity: 20,
    category_id: 1,
    brand_id: 2,
    is_hidden: false
  )

  Product.create!(
    name: 'Kaweco 經典鋼筆（EF尖）',
    description: '
    Kaweco 經典筆款，有著八角形的筆管及可以放進口袋中的小巧體積，20世紀初推出後旋即主導了德國鋼筆界的主流。

    便利的特性，也使它成為該品牌銷售榜上歷久不衰的產品，至今 Kaweco 已是德國體育界標準隨身配用鋼筆筆具。
    ',
    price: 910,
    quantity: 1,
    category_id: 1,
    brand_id: 2,
    is_hidden: false
  )

  Product.create!(
    name: 'Kaweco Liliput 迷你手帳型鋼筆（F尖）',
    description: '
    德國 Kaweco 2014年的新商品：Liliput 迷你手帳型鋼筆，可能會是你所擁有過最小的一支鋼筆，以耐久耐用的黃銅材質所製作，總長度僅有 9.6 公分，使用時再將筆蓋旋轉接上筆尾螺紋處，讓書寫更方便順手。
    ',
    price: 3200,
    quantity: 2,
    category_id: 1,
    brand_id: 2,
    is_hidden: false
  )

  Product.create!(
    name: 'Rhodia 筆記本 N°16 （點線）',
    description: '
    來自法國，筆記本紙感滑順，使用便利的貼心設計，紙質為無酸紙，適用各種筆款墨水書寫。

    封面有三道折痕，方便將封面往後折，底部加了紙板，無論在何處記錄都不成問題!更特別的是，筆記本上方有裁切線，易撕不費力，方便好用。
    ',
    price: 200,
    quantity: 7,
    category_id: 3,
    brand_id: 3,
    is_hidden: false
  )

  Product.create!(
    name: 'Rhodia 筆記本 N°13（方格）',
    description: '
    來自法國，筆記本紙感滑順，使用便利的貼心設計，紙質為無酸紙，適用各種筆款墨水書寫。

    封面有三道折痕，方便將封面往後折，底部加了紙板，無論在何處記錄都不成問題!更特別的是，筆記本上方有裁切線，易撕不費力，方便好用。
    ',
    price: 150,
    quantity: 4,
    category_id: 3,
    brand_id: 3,
    is_hidden: false
  )

  Product.create!(
    name: 'Merchant & Mills Fine Art Print',
    description: '
    精美的經典黑白海報選用高級藝術紙，符合攝影師以及藝術家對於紙質的高要求。海報上為 Merchant & Mills 產品的圖案，不但美觀又精緻，值得收藏。
    ',
    price: 2690,
    quantity: 5,
    category_id: 7,
    brand_id: 7,
    is_hidden: false
  )

  Product.create!(
    name: 'Midori 經典黃銅系列尺',
    description: '
    Midori 黃銅系列－刻畫歲月痕跡的文具，這一系列有鉛筆盒、尺、原子筆、鉛筆還有書籤，除了書籤以外，全部都是由日本職人親手打造。黃銅 (brass) 是紅銅與鋅的合金，因色黃而得名，黃銅的機械性能和耐磨性能都很好，可用於製造精密儀器、船舶的零件、樂器、槍炮的彈殼等，黃銅表面會因為時間流逝而酸化變色，呈現出獨特的光澤，若是你喜歡物品經過長時間的使用而留下歲月的痕跡，那麼 Midori 黃銅系列是個很好的選擇。
    ',
    price: 400,
    quantity: 9,
    category_id: 5,
    brand_id: 5,
    is_hidden: false
  )

  Product.create!(
    name: 'Midori MD Light筆記本（文庫/空白）',
    description: '
    Midori 筆記本讓您重新愛上書寫。

    Midori 筆記本在目前的筆記本市場中算是獨具特色的一款。它所使用的紙質不需多說，適合鋼筆書寫，能徹底攤開的貼心設計，將書寫跟閱讀變得更容易了。而它的封面設計非常簡單，是相當低調的白色封面，但是封面套上一層半透明的描圖紙，增加了設計的深度與層次；在極簡之中卻有細節。
    ',
    price: 400,
    quantity: 5,
    category_id: 3,
    brand_id: 5,
    is_hidden: false
  )

  Product.create!(
    name: 'Hightide 微型收納鐵盒',
    description: '
    馬口鐵材質，迷你的尺寸是剛好可以裝入名片的大小，共有紅、黑、藍 3 色，可將桌上散落的小物、飾品分門別類地收納，外型像個小急救箱，可愛的模樣讓人想一次全入手！
    ',
    price: 270,
    quantity: 4,
    category_id: 6,
    brand_id: 6,
    is_hidden: false
  )

  Product.create!(
    name: 'Hightide 美耐皿淺盤（M）',
    description: '
    大理石模樣的美耐皿置物盤，質地輕巧，可隨手放置文具、鑰匙、個人物品，或是用來當作店鋪的零錢盤，美化你的桌上風景。
    ',
    price: 550,
    quantity: 450,
    category_id: 6,
    brand_id: 6,
    is_hidden: false
  )

  Product.create!(
    name: 'Hightide 迷你工具盒',
    description: '
    迷你尺寸的工具箱，適合桌上收納小物，附有把手，全系列共三種顏色可選擇。
    ',
    price: 400,
    quantity: 4,
    category_id: 6,
    brand_id: 6,
    is_hidden: false
  )

  puts '創建商品*18'
