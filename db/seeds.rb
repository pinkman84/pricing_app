require('pry-byebug')
require_relative('../models/hourly_rate.rb')
require_relative('../models/job.rb')
require_relative('../models/stock.rb')
# binding.pry
hourly_rate1 = HourlyRate.new({'labour_type'=>'travel', 'rate' => 15.00}).save
hourly_rate2 = HourlyRate.new({'labour_type'=>'survey', 'rate' => 20.00}).save
hourly_rate3 = HourlyRate.new({'labour_type'=>'fabricate', 'rate' => 27.50}).save
hourly_rate4 = HourlyRate.new({'labour_type'=>'painting', 'rate' => 20.00}).save
hourly_rate5 = HourlyRate.new({'labour_type'=>'install', 'rate' => 25.00}).save
hourly_rate6 = HourlyRate.new({'labour_type'=>'admin', 'rate' => 15.00}).save

# h1 = hourly_rate1.save
# h2 = hourly_rate2.save
# h3 = hourly_rate3.save
# h4 = hourly_rate4.save
# h5 = hourly_rate5.save
# h6 = hourly_rate6.save

stock1 = Stock.new({'stock_type'=>'beams', 'stock_level'=> 0, 'meter_price'=>15.00})
stock2 = Stock.new({'stock_type'=>'RHS', 'stock_level'=> 0, 'meter_price'=>5.00})
stock3 = Stock.new({'stock_type'=>'Merchant bars', 'stock_level'=> 0, 'meter_price'=>5.00})
stock4 = Stock.new({'stock_type'=>'RSA', 'stock_level'=> 0, 'meter_price'=>3.00})
stock5 = Stock.new({'stock_type'=>'decoration', 'stock_level'=> 0, 'meter_price'=>1.50})

s1 = stock1.save
s2 = stock2.save
s3 = stock3.save
s4 = stock4.save
s5 = stock5.save
