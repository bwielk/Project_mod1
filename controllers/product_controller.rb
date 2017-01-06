require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/product')
require_relative('../models/collection')
require('pry')

# INDEX
get '/store' do 
  @products = Product.all
  @collections = Collection.all
  erb(:"/store/index")
end

#############--COLLECTIONS--################


#SHOW COLLECTIONS BY SEASONS 
get '/store/collection_id/season' do
  @collection = Collection.find(params[:collection_id])
  erb(:"/store/season")
end

#CREATE A NEW COLLECTION
post '/store' do
  @collection_new = Collection.new(params)
  @collection_new.add
  erb(:"/store/create_new_col")
end

#DESTROY A COLLECTION
post '/store/id/delete' do
  Collection.delete(params[:id])
  redirect to('/store')
end

##############--PRODUCT--###############

#NEW PRODUCT FORM
get '/store/new' do
  @collections = Collection.all
  erb(:"/store/new")
end

#NEW PRODUCT CREATED
post '/store/new_product' do 
  @product = Product.new(params)
  # if params.empty?
  #   redirect to('/fw2015/error') 
  # else
  @product.add()
  # end
  erb(:"/store/create")
  # erb(:"/fw2015/error")
end

#SHOW PRODUCT
get '/store/:id/season' do
  @product = Product.find(params[:id])
  erb(:"/store/show")
end

#EDIT PRODUCT FORM
get '/store/:id/edit' do
  @collections = Collection.all
  @product = Product.find(params[:id])
  erb(:"/store/edit")
end

#UPDATED PRODUCT
post '/store/:id' do 
  @product = Product.update(params)
  redirect to('/store')
end

#SELL PRODUCT
post '/store/:id/sell' do
  @product = Product.find(params[:id])
  @product.sell(params[:quantity])
  erb(:"/store/sell")
end

#DESTROY PRODUCT
post '/store/:id/delete' do
  Product.delete(params[:id])
  redirect to('/store')
end

####################--COLLECTION--######################


