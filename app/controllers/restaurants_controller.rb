class RestaurantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found

    def index 
        restaurants = Restaurant.all 
        render json: restaurants
        
    end

    def show 
        restaurant = find_restaurant
        render json: restaurant, serializer: RestaurantsWithPizzasSerializer 
    end

    def destroy 
        restaurant = find_restaurant
        restaurant.destroy
        head :no_content
    end

    private 
    def render_response_not_found
        render json: { error: "Restaurant not found" }, status: :not_found
    end

    def find_restaurant
        Restaurant.find(params[:id])
    end

    
end
