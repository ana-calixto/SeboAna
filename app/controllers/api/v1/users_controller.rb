class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  before_action :check_owner, only: %i[show update destroy]
  # before_action :check_login, only: %i[index]
  # before_action :check_admin, only: %i[index]

  def index
    if current_user.isadmin?
    render json: User.with_deleted
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show 
    render json: User.find(params[:id])
    # render json: UserSerializer.new(@user).serializable_hash.to_json 
  end

  def create 
    @user = User.new(user_params) 
    if @user.save 
      render json: UserSerializer.new(@user).serializable_hash.to_json, status: :created
      # render json: @user, status: :created
    else 
      render json: @user.errors, status: :unprocessable_entity
    end 
  end

  def update 
    if @user.update(user_params) 
      render json: @user, status: :ok 
    else 
      render json: @user.errors, status: :unprocessable_entity   
    end 
  end

  def destroy 
    @user.destroy 
    head 204 
  end 

  def show_deleted_users
    if current_user.isadmin?
      render json: User.only_deleted
      else
        render json: @user.errors, status: :unprocessable_entity
      end
  end
  

  private
  def user_params 
    params.require(:user).permit(:email, :password)
  end

  def set_user 
    @user = User.find(params[:id]) 
  end

  def check_owner 
    head :forbidden unless @user.id == current_user&.id   
  end

  # def check_admin 
  #   status: unauthorized unless current_user.isadmin?
  # end

end
