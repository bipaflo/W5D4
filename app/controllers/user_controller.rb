class UserController < ApplicationController 
  def index
    @users = User.all
    @cities = City.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      description: params[:description],
      email: params[:email],
      password: params[:password],
      age: params[:age],
      city_id: 1
      )
      if @user.save 
        flash[:success] = "Compte créé ! Un email de confirmation ne vous a jamais été envoyé"
        session[:user_id] = @user.id
        redirect_to root_path
        return
      else 
        render 'new'
      end
  end
end
