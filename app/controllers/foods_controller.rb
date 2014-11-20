class FoodsController < ApplicationController

  def index
    @foods = Food.all
    #foods = HTTParty('food_api')
    #foods.each do |food|

    #  Food.create(
    #    name: food['name'],
    #    expiration: food['expiration']
    #    )
    
    #end 
  end

end