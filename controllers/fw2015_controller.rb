require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/collection')
require_relative('../models/product')

get '/fw2015/index' do
  @products = Product.all
  @collections = Collection.all
  erb(:"/fw2015/index")
end

get '/fw2015/new' do
  @product = Product.all
  @collection = Collection.all
  erb(:"/fw2015/new")
end

post '/fw2015' do 
  @product = Product.new(params)
  @product.add()
  erb(:"/fw2015/create")
end

get '/fw2015/:id/edit' do
  @product = Product.new(params[:id])
  erb(:"/fw2015/edit")
end

post '/fw2015/:id' do 
  @product = Product.update(params)
  redirect to("/fw2015/#{params[:id]}")
end

post '/fw2015/:id' do 
  @product = Product.delete(params)
  redirect to('/fw2015')
end
