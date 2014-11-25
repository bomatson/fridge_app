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

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])

    if @food.update_attributes(food_params)
      redirect_to "/foods/#{@food.id}"
    else
      flash[:notice] =  @food.errors.full_messages.to_sentence

      render :edit
    end
  end

  def create
    @food = Food.new(food_params)

    if @food.save
      redirect_to '/', notice: 'Awesome!'
    else
      flash[:notice] =  @food.errors.full_messages.to_sentence
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
