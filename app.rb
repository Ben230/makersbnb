ENV["RACK_ENV"] ||= "dev"
#if not under rspec 'test' then set it to 'development'

require 'data_mapper'
require 'sinatra'
require 'dm-postgres-adapter'


require './db/data_mapper_setup'
require './lib/user'
require './lib/listing'



#above are moduls
require 'sinatra/base'

class MakersBnb < Sinatra::Base

  get '/listings/new' do
    erb :new
  end

  post '/listings' do
    Listing.create(
      name: params[:name],
    )
    redirect '/listings'
  end

  get '/listings' do
    erb :listings
  end

  get '/listings' do
    @listings = Listing.all
    erb :listings
  end

  run! if app_file == $0
end