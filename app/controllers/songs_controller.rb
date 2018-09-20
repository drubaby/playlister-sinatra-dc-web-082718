require 'rack-flash'
class SongsController < ApplicationController
  # enable :sessions
  use Rack::Flash

#READ
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(name: params["song_name"])
    @song.artist = Artist.find_or_create_by(name: params["artist_name"])
    @song.genre_ids = params[:genres]
    # binding.pry
    @song.save

    flash[:message] = "Successfully created song."
    # binding.pry
    redirect("songs/#{@song.slug}")
  end

  # post '/songs' do
  #   song_name = params["song_name"]
  #   artist = Artist.find_or_create_by(name: params["artist_name"])
  #   genre_ids = params[:genres]
  #   @song = Song.create
  # end



end
