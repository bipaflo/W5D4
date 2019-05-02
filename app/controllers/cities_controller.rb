class CitiesController < ApplicationController
  def index
    @cities = City.all
    @users = User.all
    @gossips = Gossip.all
  end

  def show
    @city = City.find(params[:id])
  end

end
