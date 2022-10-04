class RestaurantPizzaSerializer < ActiveModel::Serializer
  attributes :price 

  has_one :pizza 
end
