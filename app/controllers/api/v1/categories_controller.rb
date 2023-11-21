class Api::V1::CategoriesController < ApplicationController
  before_action :check_login, only: %i[create]
  
  def show
    render json: Category.find(params[:id])
  end

  def index
    render json: Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      render json: @category, status: :created
    else
      render json: { errors: @category.errors }, status: :unprocessable_entity
    end
  end

  def destroy 
    apagacat = Category.find(params[:id])
    apagacat.destroy
    render json: @category 
    head 204
  end

  
 private

  def category_params
    params.require(:category).permit(:name)
  end

  

end


