require_relative('../models/job.rb')
require('pry-byebug')


get '/jobs' do
  @jobs = Job.all()
  @hours = HourlyRate.all()
  @stock = Stock.all
  erb :'jobs/index'
end

get '/jobs/new' do
  @stocks = Stock.all()
  @hrs = HourlyRate.all()
  erb :'jobs/new'
end

post '/jobs' do
  @jobs = Job.new(params)
  @jobs.save
  redirect to('/jobs')
end

get '/jobs/:id' do
  @stock = Stock.all
  @job = Job.find(params[:id])
  erb :'jobs/show'
end

get '/jobs/:id/edit' do
  @jobs = Job.find(params[:id])
  erb(:'jobs/edit')
end

put '/jobs/:id' do
  @stock = Stock.all()
  @jobs = Job.new(params)
  # @jobs.check_stock(params)
end

delete '/jobs/:id' do
  Job.destroy(params[:id])
  redirect to('/jobs')
end