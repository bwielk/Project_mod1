require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/collection')
require_relative('../models/product')
require('pry')
# INDEX
get '/fw2015' do 
  @products = Product.all
  @collections = Collection.all
  erb(:"/fw2015/index")
end
#SHOW COLLECTIONS BY SEASONS 
get '/fw2015/collection_id/season' do
  @collection = Collection.find(params[:collection_id])
  erb(:"/fw2015/season")
end

#NEW PRODUCT FORM
get '/fw2015/new' do
  @collections = Collection.all
  erb(:"/fw2015/new")
end

#NEW PRODUCT CREATED
post '/fw2015' do 
  @product = Product.new(params)
  @product.add()
  erb(:"/fw2015/create")
end

#SHOW PRODUCT
get '/fw2015/:id/season' do
  @product = Product.find(params[:id])
  erb(:"/fw2015/show")
end
#EDIT PRODUCT FORM
get '/fw2015/:id/edit' do
  @product = Product.find(params[:id])
  erb(:"/fw2015/edit")
end
#UPDATED PRODUCT
post '/fw2015/:id' do 
 Product.update(params)
  redirect to('/fw2015')
end
#SELL PRODUCT
post '/fw2015/:id/sell/:number' do
  @product = Product.find(params[:id])
  @product.sell(params[:number])
  erb(:"/fw2015/sell")
end

#DESTROY PRODUCT
post '/fw2015/:id/delete' do
  Product.delete(params[:id])
  redirect to('/fw2015')
end
