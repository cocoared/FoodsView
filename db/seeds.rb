# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Admin.exists?(email: "admin@a") == false
  Admin.create!(
    email: "admin@a",
    password: "aaaaaa",
  )
end

Tag.create!([
    { tag_name: '肉類' },
    { tag_name: '魚介類' },
    { tag_name: '野菜'},
    { tag_name: '調味料'},
    { tag_name: '麺類'},
    { tag_name: 'その他'}
])