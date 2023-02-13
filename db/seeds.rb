# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Admin.create!(
   email: 't.manhole@run',
   password: 'takrun'
)

Tag.create([
    {name: 'アニメ'},
    {name: '城'},
    {name: '富士山'},
    {name: '動物'},
    {name: '海'},
    ])
    
User.create!(
  name: "Yoichi",
  password: "egoist",
  email: "test1@test",
  introduction: "hello",
) 

User.create!(
  name: "Meguru",
  password: "monster",
  email: "test2@test",
  introduction: "hello",
)

User.create!(
  name: "Baro",
  password: "kingbaro",
  email: "test3@test",
  introduction: "hello",
)