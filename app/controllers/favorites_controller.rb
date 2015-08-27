class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
      @favorites = current_user.favorites
      @beenthere = @favorites.where(:visited => true)
      @bucketlist = @favorites.where(:visited => nil)
      @hash1 = Gmaps4rails.build_markers(@beenthere) do |favorite, marker|
        marker.lat favorite.brewery.latitude
        marker.lng favorite.brewery.longitude
      end
      @hash2 = Gmaps4rails.build_markers(@bucketlist) do |favorite, marker|
        marker.lat favorite.brewery.latitude
        marker.lng favorite.brewery.longitude
      end
  end

  def show
    @favorite = Favorite.find(params[:id])
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new
    @favorite.notes = params[:notes]
    @favorite.visited = params[:visited]
    @favorite.brewery_id = params[:brewery_id]
    @favorite.user_id = params[:user_id]

    if @favorite.save
      redirect_to :back, :notice => "Favorite created successfully."
    else
      render 'new'
    end
  end

  def edit
    @favorite = Favorite.find(params[:id])
  end

  def update
    @favorite = Favorite.find(params[:id])

    @favorite.notes = params[:notes]
    @favorite.visited = params[:visited]
    @favorite.brewery_id = params[:brewery_id]
    @favorite.user_id = params[:user_id]

    if @favorite.save
      redirect_to "/favorites", :notice => "Favorite updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])

    @favorite.destroy

    redirect_to "/favorites", :notice => "Favorite deleted."
  end
end
