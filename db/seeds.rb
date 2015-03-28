# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

avatar =  User.create(username: 'avatar', email: 'avatar@gmail.com', password: 'asdfgh', password_confirmation: 'asdfgh', real_name: 'Peter Chan')
avatar.images << Image.create(name: 'avatar.jpg')
Address.create(line1: '18 Raffles Quay', line2: '#16-174', city: 'Singapore', country_subdivision: 'sg', postal_code: '174744', country: 'Singapore', user_id: avatar.id)
Card.create(account_number:'5184680430000006', expiry_month: 12, expiry_year: 2019, cvc: 111, owner_id: avatar.id)
micaiah = User.create(username: 'micaiah', email: 'cindy@gmail.com', password:'asdfgh', password_confirmation: 'asdfgh', real_name: 'Micaiah Majar')
micaiah.images << Image.create(name: 'micaiah.jpg')
micaiah.update_attribute(:address, Address.create(line1: '1 Kadayanallur St', line2: '#16-174', city: 'Singapore', country_subdivision: 'sg', postal_code: '174744', country: 'Singapore', user_id: micaiah.id))
Card.create(account_number:'5184680430000022', expiry_month: 12, expiry_year: 2019, cvc: 111, owner_id: micaiah.id)
lyndis = User.create(username: 'lyndis', email: 'lyndis@gmail.com', password:'asdfgh', password_confirmation: 'asdfgh', real_name: 'Lynn Wallace ')
lyndis.images << Image.create(name: 'lyndis.jpg')
lyndis.update_attribute(:address, Address.create(line1: '56 North Bridge Road', line2: '#16-174', city: 'Singapore', country_subdivision: 'sg', postal_code: '174744', country: 'Singapore', user_id: lyndis.id))
Card.create(account_number:'5184680430000030', expiry_month: 12, expiry_year: 2019, cvc: 111, owner_id: lyndis.id)
isadora = User.create(username: 'isadora', email: 'isadora@gmail.com', password: 'asdfgh', password_confirmation: 'asdfgh', real_name: 'Isadora Duncan ')
isadora.images << Image.create(name: 'isadora.jpg')
isadora.update_attribute(:address, Address.create(line1: '64 Hillview Ave', line2: '#16-174', city: 'Singapore', country_subdivision: 'sg', postal_code: '174744', country: 'Singapore', user_id: isadora.id))
Card.create(account_number:'5184680430000261', expiry_month: 12, expiry_year: 2019, cvc: 111, owner_id: isadora.id)
sakura = User.create(username: 'sakura', email: 'sakura@gmail.com', password: 'asdfgh', password_confirmation: 'asdfgh', real_name: 'Saruka Haruno')
sakura.images << Image.create(name: 'sakura.jpg')
sakura.update_attribute(:address, Address.create(line1: '24 Lower Delta Road', line2: '#16-174', city: 'Singapore', country_subdivision: 'sg', postal_code: '174744', country: 'Singapore', user_id: avatar.id))
Card.create(account_number:'5184680430000279', expiry_month: 12, expiry_year: 2019, cvc: 111, owner_id: sakura.id)
mai = User.create(username: 'mai', email: 'mai@gmail.com', password: 'asdfgh', password_confirmation: 'asdfgh', real_name: 'Mai Nguyen')
mai.images << Image.create(name: 'mai.jpg')
mai.update_attribute(:address, Address.create(line1: '77 Bedok Reservoir View', line2: '#16-174', city: 'Singapore', country_subdivision: 'sg', postal_code: '174744', country: 'Singapore', user_id: mai.id))
Card.create(account_number:'5184680430000261', expiry_month: 12, expiry_year: 2019, cvc: 111, owner_id: mai.id)
maria = User.create(username: 'maria', email: 'maria@gmail.com', password: 'asdfgh', password_confirmation: 'asdfgh', real_name: 'Maria Clara')
maria.images << Image.create(name: 'maria.jpg')
maria.update_attribute(:address, Address.create(line1: '14 Nanyang Crescent', line2: '#16-174', city: 'Singapore', country_subdivision: 'sg', postal_code: '174744', country: 'Singapore', user_id: maria.id))
Card.create(account_number:'5184680430000030', expiry_month: 12, expiry_year: 2019, cvc: 111, owner_id: maria.id)

Dish.delete_all
dish_1 = Dish.create(name: 'Chinese Roast Pork Belly', price: 5.99, quantity: 5, category: 'Chinese, Asian, Pork', owner_id: micaiah.id, last_order: 6.hours.from_now, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
dish_1.images << Image.create(name: 'dish_1_1.jpg')
dish_1.images << Image.create(name: 'dish_1_2.jpg')

dish_2 = Dish.create(name: 'Spinach Dumpling Soup', price: 5.99, quantity: 5, category: 'Chinese, Local, Soup', owner_id: micaiah.id, last_order: 6.hours.from_now, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
dish_2.images << Image.create(name: 'dish_2_1.jpg')
dish_2.images << Image.create(name: 'dish_2_2.jpg')

dish_3 = Dish.create(name: 'Homemade Fruit Cocktail', price:3.99, quantity:20, category: 'Mixed, Fruit, Cocktail', owner_id: lyndis.id, last_order: 5.hours.from_now, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
dish_3.images << Image.create(name: 'dish_3_1.jpg')
dish_3.images << Image.create(name: 'dish_3_2.jpg')

dish_4 = Dish.create(name: 'Grilled Banana With Coconut Milk', price: 2.99, quantity: 40, category: 'Vietnamese, Asian, Dessert, Fruit, Coconut', owner_id: mai.id, last_order: 45.minutes.from_now, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
dish_4.images << Image.create(name: 'dish_4_1.jpg')
dish_4.images << Image.create(name: 'dish_4_2.jpg')

dish_5 = Dish.create(name: 'Savory Steamed Rice Cake', price: 3.99, quantity: 40, category: 'Vietnamese, Asian, rice cake, steamed', owner_id: mai.id, last_order: 45.minutes.from_now, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
dish_5.images << Image.create(name: 'dish_5_1.jpg')
dish_5.images << Image.create(name: 'dish_5_2.jpg')
dish_5.images << Image.create(name: 'dish_5_2.jpg')

dish_6 = Dish.create(name: 'Takoyaki', price: 3.99, quantity: 40, category: 'Vietnamese, Asian, rice cake, steamed', owner_id: sakura.id, last_order: 45.minutes.from_now, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
dish_6.images << Image.create(name: 'dish_6_1.jpg')
dish_6.images << Image.create(name: 'dish_6_2.jpg')

dish_7 = Dish.create(name: 'Italian Bruschetta', price: 7.99, quantity: 10, category: 'Western, Italian, Bread, Tomato', owner_id: lyndis.id, last_order: 3.hours.from_now, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
dish_7.images << Image.create(name: 'dish_7_1.jpg')
dish_7.images << Image.create(name: 'dish_7_2.jpg')

dish_8 = Dish.create(name: 'Chicken Adobo', price: 7.99, quantity: 10, category: 'Filipino, Asian, Chicken, Rice', owner_id: maria.id, last_order: 3.hours.from_now, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
dish_8.images << Image.create(name: 'dish_8_1.jpg')

dish_9 = Dish.create(name: 'Brownie', price: 7.99, quantity: 10, category: 'Cake, Dessert, Brownie', owner_id: lyndis.id, last_order: 3.hours.from_now, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
dish_9.images << Image.create(name: 'dish_9_1.jpg')

dish_10 = Dish.create(name: 'Sushi', price: 7.99, quantity: 10, category: 'Japanese', owner_id: sakura.id, last_order: 3.hours.from_now, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
dish_10.images << Image.create(name: 'dish_10_1.jpg')

dish_11 = Dish.create(name: 'French Onion Soup', price: 4.99, quantity: 10, category: 'French, Western, Soup', owner_id: isadora.id, last_order: 3.hours.from_now, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
dish_11.images << Image.create(name: 'dish_11_1.jpg')

dish_12 = Dish.create(name: 'Spaghetti Bolognese with Soft Boiled Egg', price: 5.99, quantity: 6, category: 'Italian, Western, Noodle, Egg', owner_id: lyndis.id, last_order: 1.hours.from_now, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
dish_12.images << Image.create(name: 'dish_12_1.jpg')

dish_13 = Dish.create(name: 'Sambal Laksa', price: 5.99, quantity: 6, category: 'Malay, Asian, Noodle, Curry', owner_id: avatar.id, last_order: 1.hours.from_now, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
dish_13.images << Image.create(name: 'dish_13_1.jpg')

dish_14 = Dish.create(name: 'Oshiruko - Japanese Red Bean Soup', price: 5.99, quantity: 6, category: 'Japanese, Asian, Dessert', owner_id: sakura.id, last_order: 1.hours.from_now, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
dish_14.images << Image.create(name: 'dish_14_1.jpg')

dish_15 = Dish.create(name: 'Dorayaki - Red Bean Pan Cake', price: 5.99, quantity: 6, category: 'Japanese, Asian, Dessert', owner_id: sakura.id, last_order: 1.hours.from_now, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
dish_15.images << Image.create(name: 'dish_15_1.jpg')

dish_16 = Dish.create(name: 'Sisig Tacos', price: 5.99, quantity: 6, category: 'Filipino, Asian, Pork, Sisig', owner_id: maria.id, last_order: 1.hours.from_now, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
dish_16.images << Image.create(name: 'dish_16_1.jpg')

dish_16 = Dish.create(name: 'Sisig Tacos', price: 5.99, quantity: 6, category: 'Filipino, Asian, Pork, Sisig', owner_id: maria.id, last_order: 1.hours.from_now, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
dish_16.images << Image.create(name: 'dish_16_1.jpg')

dish_17 = Dish.create(name: 'Broken Rice', price: 4.99, quantity: 6, category: 'Vietnamese, Asian, Pork, Egg', owner_id: mai.id, last_order: 1.hours.from_now, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
dish_17.images << Image.create(name: 'dish_17_1.jpg')

dish_18 = Dish.create(name: 'Prawn Cake', price: 1.99, quantity: 10, category: 'Vietnamese, Asian, Prawn, Egg', owner_id: mai.id, last_order: 1.hours.from_now, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
dish_18.images << Image.create(name: 'dish_18_1.jpg')

dish_18 = Dish.create(name: 'Prawn Cake', price: 1.99, quantity: 10, category: 'Vietnamese, Asian, Prawn, Egg', owner_id: mai.id, last_order: 1.hours.from_now, description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
dish_18.images << Image.create(name: 'dish_18_1.jpg')




Place.delete_all
Place.create(address: 'Bishan MRT', timeslot: '6:30pm', area: 'Bishan', owner_id: lyndis.id)
Place.create(address: 'City Hall MRT', timeslot: '6:00 pm', area: 'City Hall', owner_id: lyndis.id)
Place.create(address: 'Serangoon MRT', timeslot: '7:00 pm', area: 'Serangoon', owner_id: lyndis.id)
Place.create(address: 'Jurong East MRT', timeslot: '6:00 pm', area: 'Jurong', owner_id: micaiah.id)
Place.create(address: 'Tiong Bahru MRT', timeslot: '6:30 pm', area: 'Tiong Bahru', owner_id: micaiah.id)
Place.create(address: 'City Hall MRT', timeslot: '7:00 pm', area: 'City Hall', owner_id: micaiah.id)
Place.create(address: 'City Hall MRT', timeslot: '6:00 pm', area: 'City Hall', owner_id: isadora.id)
Place.create(address: 'Bishan MRT', timeslot: '6:30 pm', area: 'Bishan', owner_id: isadora.id)
Place.create(address: 'Harbour Front MRT', timeslot: '7:00 pm', area: 'Habour Front', owner_id: isadora.id)
Place.create(address: 'Harbour Front MRT', timeslot: '6:00 pm',  area: 'Habour Front', owner_id: sakura.id)
Place.create(address: 'Serangoon MRT', timeslot: '6:30pm',  area: 'Serangoon', owner_id: sakura.id)
Place.create(address: 'Tiong Bahru MRT', timeslot: '6pm', area:'Tiong Bahru', owner_id: mai.id)
Place.create(address: 'Lakeside MRT', timeslot: '6:30pm', area: 'Jurong', owner_id: mai.id)

Order.delete_all
