require_relative('../models/stock.rb')
require('pry-byebug')

#INDEX------------
get '/stocks' do
  @stock = Stock.all()
  erb :'stocks/index'
end


post '/stocks' do
  @stock = Stock.new(params)
  @stock.save
  erb :'stocks/create'
end

get '/stocks/:id' do
 
  @stocks = Stock.find( params[:id] )
  erb( :'stocks/show' )
end

get '/stocks/:id/edit' do
  
  @stocks = Stock.find( params[:id] )
  erb( :'stocks/edit' )
end

put '/stocks/:id' do
  @stocks = Stock.new(params)
  @stocks.add_stock( params[:stock_level] )
  redirect to( "/stocks/#{params[:id]}" )
end
