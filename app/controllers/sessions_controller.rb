class SessionsController < ApplicationController
  def new 
    @user = User.new
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:success] = "Vous vous êtes identifié correctement. Bienvenue #{user.first_name} !"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    if session.delete(:user_id)
      flash[:primary] = "Tu as bien été deconnecté. A bientôt !"
      redirect_to root_path
      return
    else
    end
  end

end
