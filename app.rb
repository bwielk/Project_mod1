require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/fw2015_controller')


get '/' do
erb(:index)
end