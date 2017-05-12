# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 新增 admin 帳號 - User #
create_account = User.create([
  name: '測試管理員',
  email: 'admin@rails.com',
  password: '111111',
  password_confirmation: '111111',
  is_admin: 'true'
])

puts '創建管理員*1'

# 新增 user 帳號 - User #
create_account = User.create([
  name: '測試用戶',
  email: 'admin@rails.com',
  password: '111111',
  password_confirmation: '111111',
  is_admin: 'false'
])

puts '創建一般用戶*1'

# 新增品牌 - Brand #

brand_name = [
  'BEAMS',
  'Yoshida Porter',
  'MUJI',
  'MONOCLE',
  'CLASSICO',
  'Champion',
  'URBAN RESEARCH'
]

create_brands = for i in 1..5 do
  Brand.create!(
  name: brand_name[rand(brand_name.length)],
  description: 'About',
  logo: 'No image'
  )
end

puts '創建品牌*5'

# 新增分類 - Category #

Category.create!(
  name: '杯子',
  category_group_id: 1
)

Category.create!(
  name: '鋼筆',
  category_group_id: 2
)

Category.create!(
  name: '收納',
  category_group_id: 2
)

puts '創建分類*3'

# 新增大分類 - CategoryGroup #

CategoryGroup.create!(
  name: 'KITCHEN'
)

CategoryGroup.create!(
  name: 'DESK'
)

puts '創建大類別*2'
