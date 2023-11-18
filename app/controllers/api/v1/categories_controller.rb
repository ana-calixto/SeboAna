class Api::V1::CategoriesController < ApplicationController

  def show
    render json: Category.find(params[:id])
  end

  def index
    render json: Category.all
  end

  def create
    if category.save
      render json: category, status: :created
    else
      render json: { errors: category.errors }, status: :unprocessable_entity
    end
  end

  def destroy 
    @category.destroy
    head 204
  end
 private

  def category_params
    params.require(:category).permit(:name)
  end

end


