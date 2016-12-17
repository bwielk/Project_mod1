require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/fw2016_controller')
require_relative('controllers/ss2016_controller')
require_relative('controllers/fw2015_controller')


get '/index' do
erb(:index)
end