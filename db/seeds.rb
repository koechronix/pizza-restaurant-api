puts "Seeding restaurants..."
Restaurant.create!([
  {
    name: "Sottocasa NYC",
    address: "298 Atlantic Ave, Brooklyn, NY 11201"
  },
  {
    name: "PizzArte",
    address: "69 W 55th St, New York, NY 10019"
  },
  {
    name: "San Matteo NYC",
    address: "1559 2nd Ave, New York, NY 10028"
  }
])

puts "Seeding pizzas..."
Pizza.create!([
  {
    name: "Cheese",
    ingredients: "Dough, Tomato Sauce, Cheese"
  },
  {
    name: "Pepperoni",
    ingredients: "Dough, Tomato Sauce, Cheese, Pepperoni"
  },
  {
    name: "Pillau",
    ingredients: "Meat, Rice, Tomato, Chilly"
  },
  {
    name: "Chicken",
    ingredients: "Cheese, Tomato, Chilly, Pilipilihoho"
  },
  {
    name: "Chapoo",
    ingredients: "Soup, cheese, meat"
  }
])

puts "Adding pizzas to restaurants..."
Restaurant.all.each do |restaurant|
  rand(1..5).times do
    # get a random pizza
    pizza = Pizza.find(Pizza.pluck(:id).sample)

    RestaurantPizza.create!(restaurant_id: restaurant.id, pizza_id: pizza.id, price: rand(5..25))
  end
end

puts "Done seeding!"