require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('controller/hr_controller.rb')
require_relative('controller/job_controller.rb')
require_relative('controller/stock_controller.rb')

get '/home' do
  erb :home
end