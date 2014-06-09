class SongsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    song_name = params[:song_name]
    artist_name = params[:artist_name]
    @song = Song.new(song_name: song_name, artist_name: artist_name)
    @song.save
    redirect_to songs_path
  end

  def show
    id = params[:id]
    @song = Song.find(id)
  end

  def edit
    @id = params[:id]
  end

  def update
    id = params[:id]
    Song.update(id, artist_name: params[:artist_name], song_name: params[:song_name])
    redirect_to songs_path
  end
end
