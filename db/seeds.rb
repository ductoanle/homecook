# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

avatar =  User.create(username: 'avatar', email: 'avatar@gmail.com', password: 'asdfgh', password_confirmation: 'asdfgh')
avatar.images << Image.create(name: 'avatar.jpg')
micaiah = User.create(username: 'micaiah', email: 'cindy@gmail.com', password:'asdfgh', password_confirmation: 'asdfgh')
micaiah.images << Image.create(name: 'micaiah.jpg')
lyndis = User.create(username: 'lyndis', email: 'lyndis@gmail.com', password:'asdfgh', password_confirmation: 'asdfgh')
lyndis.images << Image.create(name: 'lyndis.jpg')
isadora = User.create(username: 'isadora', email: 'isadora@gmail.com', password: 'asdfgh', password_confirmation: 'asdfgh')
isadora.images << Image.create(name: 'isadora.jpg')
anna = User.create(username: 'anna', email: 'anna@gmail.com', password: 'asdfgh', password_confirmation: 'asdfgh')
anna.images << Image.create(name: 'anna.jpg')
iris = User.create(username: 'iris', email: 'iris@gmail.com', password: 'asdfgh', password_confirmation: 'asdfgh')
iris.images << Image.create(name: 'iris.jpg')


Dish.delete_all
dish_1 = Dish.create(name: 'Chinese Roast Pork Belly', price: 5.99, quantity: 5, category: 'Japanese', owner_id: micaiah.id, last_order: 6.hours.from_now)
dish_1 << Image.create(name: 'dish_1_1.jpg')
dish_1 << Image.create(name: 'dish_1_2.jpg')

dish_1 = Dish.create(name: 'Spinach Dumpling Soup', price: 5.99, quantity: 5, category: 'Japanese', owner_id: micaiah.id, last_order: 6.hours.from_now)


Dish.create(name: 'GRILLED SABA FISH W JAPANESE SOYA SAUCE', price: 5.99, quantity: 5, category: 'Japanese', owner_id: micaiah.id, last_order: 6.hours.from_now)
Dish.create(name: 'POTATO & CARROT W SLICED CHICKEN SOUP', price: 4.99, quantity: 4, category: 'Chinese, Local', owner_id: lyndis.id, last_order: 12.hours.from_now)
Dish.create(name: 'PAN FRIED EGG W SHREDDED CABBAGE & HAM W TONGKATSU SAUCE', price: 5.80, category: 'Japanese', owner_id: isadora.id, quantity: 5, last_order: 45.minutes.from_now)

Place.delete_all
Place.create(address: '18 Raffles Quay Singapore 048582', timeslot: '5pm', owner_id: lyndis.id)
Place.create(address: '1 Kadayanallur St, Singapore 069184', timeslot: '6pm', owner_id: micaiah.id)
Place.create(address: '83 Seng Poh Rd, Singapore 161057', timeslot: '6:30pm', owner_id: isadora.id)

Order.delete_all
