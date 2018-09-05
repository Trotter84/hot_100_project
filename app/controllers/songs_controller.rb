class SongsController < ApplicationController
  before_action :set_artist
  before_action :set_song, except: [:index, :create, :new]

  def index
    @songs = @artist.songs
  end

  def show
  end

  def new
    @artist.songs.new
  end

  def create
    @song = @artist.song.new(song_params)

    if @song.save
      # redirect_to show song
    else

    end
  end

  def edit
  end

  def update
    @song = @artist.song.new(song_params)

    if @song.update
      # redirect_to show song
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    # redirect_to show songs
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
