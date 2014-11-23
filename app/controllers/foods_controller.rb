class FoodsController < ApplicationController

  def new
    @food = Food.new
  end

  def index
    @foods = Food.all
  end

  def show
    #only want one instance
    #get the instance from the database with ID, name
    @food = Food.find(params[:id])
  end

  def create
    @food = Food.new(food_params)

    if @food.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to '/'
  end
  #foods = HTTParty('food_api')
  #foods.each do |food|

  #  Food.create(
  #    name: food['name'],
  #    expiration: food['expiration']
  #    )

  #end
  private

  def food_params
    params.require(:food).permit(:name, :expiration, :food_type)
  end
end
