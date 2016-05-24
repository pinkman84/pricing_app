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
  @job = Job.find(params[:id])
  erb :'jobs/show'
end