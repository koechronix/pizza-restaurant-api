class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entitiy_response


    def create 
        restaurant_pizza = RestaurantPizza.create!(restaurant_pizza_params)
        render json: restaurant_pizza.pizza, status: :created
    end

    private 

    def restaurant_pizza_params 
        params.permit(:pizza_id, :restaurant_id, :price)
    end

    def render_unprocessable_entitiy_response(exception)
        render json: { errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end
end
