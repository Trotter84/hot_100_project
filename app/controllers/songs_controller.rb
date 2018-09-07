class SongsController < ApplicationController
  before_action :set_artist, except: [:like]
  before_action :set_song, except: [:create, :new]

  def new
    @billboards = Billboard.all
    @song = @artist.songs.new
  end

  def create
    @song = @artist.songs.new(song_params)

    if @song.save
      redirect_to artist_path(@song.artist_id)
    else
      render :new
    end
  end

  def edit
    @billboards = Billboard.all
  end

  def update
    if @song.update(song_params)
      redirect_to artist_path(@song.artist_id)
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to artist_path(@song.artist_id)
  end

  def like
    @song.update({likes: @song.likes + 1})
    redirect_to billboard_path(params[:billboard_id])
  end

  private

    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    def set_song
      @song = Song.find(params[:id])
    end

    def song_params
      params.require(:song).permit(:name, :billboard_id)
    end    
end
