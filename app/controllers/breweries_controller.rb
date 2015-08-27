class BreweriesController < ApplicationController
    before_action :authenticate_user!

  def index
    # all breweries, ordered by favorites for the user
    # @breweries = Brewery.join(:favorites).order(('favorites.user_id = ?', current_user.id), ('favorites.visited = ?', true))
    @breweries = Brewery.all
    # @breweries = @breweries.sort {|a,b| a.favorites.where(user_id: current_user.id).where(visited: true) <=> a.favorites.where(user_id: current_user.id).where(visited: false) }
  end

  def show
    @brewery = Brewery.find(params[:id])
  end

  def new
    @brewery = Brewery.new
  end

  def create
    @brewery = Brewery.new
    @brewery.brewery_id = params[:brewery_id]
    @brewery.notes = params[:notes]
    @brewery.image_url = params[:image_url]
    @brewery.address = params[:address]
    @brewery.name = params[:name]

    if @brewery.save
      redirect_to "/breweries", :notice => "Brewery created successfully."
    else
      render 'new'
    end
  end

  def edit
    @brewery = Brewery.find(params[:id])
  end

  def update
    @brewery = Brewery.find(params[:id])

    @brewery.brewery_id = params[:brewery_id]
    @brewery.notes = params[:notes]
    @brewery.image_url = params[:image_url]
    @brewery.address = params[:address]
    @brewery.name = params[:name]

    if @brewery.save
      redirect_to "/breweries", :notice => "Brewery updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @brewery = Brewery.find(params[:id])

    @brewery.destroy

    redirect_to "/breweries", :notice => "Brewery deleted."
  end
end
