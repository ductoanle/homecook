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
sakura = User.create(username: 'sakura', email: 'sakura@gmail.com', password: 'asdfgh', password_confirmation: 'asdfgh')
sakura.images << Image.create(name: 'sakura.jpg')
mai = User.create(username: 'mai', email: 'mai@gmail.com', password: 'asdfgh', password_confirmation: 'asdfgh')
mai.images << Image.create(name: 'mai.jpg')
iris = User.create(username: 'iris', email: 'iris@gmail.com', password: 'asdfgh', password_confirmation: 'asdfgh')
iris.images << Image.create(name: 'iris.jpg')


Dish.delete_all
dish_1 = Dish.create(name: 'Chinese Roast Pork Belly', price: 5.99, quantity: 5, category: 'Chinese, Asian, Pork', owner_id: micaiah.id, last_order: 6.hours.from_now)
dish_1.images << Image.create(name: 'dish_1_1.jpg')
dish_1.images << Image.create(name: 'dish_1_2.jpg')

dish_2 = Dish.create(name: 'Spinach Dumpling Soup', price: 5.99, quantity: 5, category: 'Chinese, Local, Soup', owner_id: micaiah.id, last_order: 6.hours.from_now)
dish_2.images << Image.create(name: 'dish_2_1.jpg')
dish_2.images << Image.create(name: 'dish_2_2.jpg')

dish_3 = Dish.create(name: 'Homemade Fruit Cocktail', price:3.99, quantity:20, category: 'Mixed, Fruit, Cocktail', owner_id: lyndis.id, last_order: 5.hours.from_now)
dish_3.images << Image.create(name: 'dish_3_1.jpg')
dish_3.images << Image.create(name: 'dish_3_2.jpg')

dish_4 = Dish.create(name: 'Grilled Banana With Coconut Milk', price: 2.99, quantity: 40, category: 'Vietnamese, Asian, Dessert, Fruit, Coconut', owner_id: mai.id, last_order: 45.minutes.from_now)
dish_4.images << Image.create(name: 'dish_4_1.jpg')
dish_4.images << Image.create(name: 'dish_4_2.jpg')

dish_5 = Dish.create(name: 'Savory Steamed Rice Cake', price: 3.99, quantity: 40, category: 'Vietnamese, Asian, rice cake, steamed', owner_id: mai.id, last_order: 45.minutes.from_now)
dish_5.images << Image.create(name: 'dish_5_1.jpg')
dish_5.images << Image.create(name: 'dish_5_2.jpg')
dish_5.images << Image.create(name: 'dish_5_2.jpg')

dish_6 = Dish.create(name: 'Takoyaki', price: 3.99, quantity: 40, category: 'Vietnamese, Asian, rice cake, steamed', owner_id: sakura.id, last_order: 45.minutes.from_now)
dish_6.images << Image.create(name: 'dish_6_1.jpg')
dish_6.images << Image.create(name: 'dish_6_2.jpg')

dish_7 = Dish.create(name: 'Italian Bruschetta', price: 7.99, quantity: 10, category: 'Western, Italian, Bread, Tomato', owner_id: sakura.id, last_order: 3.hours.from_now)
dish_7.images << Image.create(name: 'dish_7_1.jpg')
dish_7.images << Image.create(name: 'dish_7_2.jpg')

dish_8 = Dish.create(name: 'Chicken Adobo', price: 7.99, quantity: 10, category: 'Filipino, Asian, Chicken, Rice', owner_id: sakura.id, last_order: 3.hours.from_now)
dish_8.images << Image.create(name: 'dish_8_1.jpg')

dish_9 = Dish.create(name: 'Brownie', price: 7.99, quantity: 10, category: 'Cake, Dessert, Brownie', owner_id: lyndis.id, last_order: 3.hours.from_now)
dish_9.images << Image.create(name: 'dish_9_1.jpg')

dish_10 = Dish.create(name: 'Sushi', price: 7.99, quantity: 10, category: 'Japanese', owner_id: sakura.id, last_order: 3.hours.from_now)
dish_10.images << Image.create(name: 'dish_10_1.jpg')


Place.create(address: '18 Raffles Quay Singapore 048582', timeslot: '5pm', owner_id: lyndis.id)
Place.create(address: 'Bishan MRT', timeslot: '6pm', owner_id: lyndis.id)
Place.create(address: 'City Hall MRT', timeslot: '6:30 pm', owner_id: lyndis.id)
Place.create(address: '1 Kadayanallur St, Singapore 069184', timeslot: '6pm', owner_id: micaiah.id)
Place.create(address: 'Jurong East MRT', timeslot: '6pm', owner_id: micaiah.id)
Place.create(address: 'Tiong Bahru MRT', timeslot: '6:30pm', owner_id: micaiah.id)
Place.create(address: '83 Seng Poh Rd, Singapore 161057', timeslot: '6:30pm', owner_id: isadora.id)
Place.create(address: 'Sommerset MRT', timeslot: '6pm', owner_id: isadora.id)
Place.create(address: 'Yishun MRT', timeslot: '6:30pm', owner_id: isadora.id)
Place.create(address: '108 Habour Front Walk, Singapore 098585', timeslot: '6:30pm', owner_id: sakura.id)
Place.create(address: 'Harbour Front MRT', timeslot: '6pm', owner_id: sakura.id)
Place.create(address: 'Serangoon MRT', timeslot: '6:30pm', owner_id: sakura.id)
Place.create(address: '55 Havelock Road, Singapore 161585', timeslot: '5:30pm', owner_id: mai.id)
Place.create(address: 'Tiong Bahru MRT', timeslot: '6pm', owner_id: mai.id)
Place.create(address: 'Clementi MRT', timeslot: '6:30pm', owner_id: mai.id)

Order.delete_all
