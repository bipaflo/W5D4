class WelcomeController < ApplicationController
  def first_name
    @user = User.find(params[:id])
    puts "$" * 60
    puts "Voici le message de l'URL :"
    puts params[:id]
    puts "$" * 60
  end
end
