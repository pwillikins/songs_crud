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
    redirect_to '/'
  end
end
