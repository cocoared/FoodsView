# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: "admin@a",
  password: "aaaaaa",
)

Tag.create!([
    { name: '肉類' },
    { name: '魚介類' },
    { name: '野菜'},
    { name: '調味料'},
    { name: '麺類'},
    { name: 'その他'}
])