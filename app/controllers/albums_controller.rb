class AlbumsController < ApplicationController
  def new
    @band = Band.find_by(id: params[:band_id])
    @album = Album.new
    render :new
  end

  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      @band = @album.band
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def update
    @album = Album.find_by(id: params[:id])
    @album.update_attributes(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  private
  def album_params
    params.require(:album).permit(:band_id, :title, :live, :year)
  end
end