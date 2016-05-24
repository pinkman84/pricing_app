require('pg')
require_relative('../db/sql_runner.rb')

class HourlyRate
  attr_accessor(:id, :labour_type, :rate)
  def initialize(options)
    @id = options['id'].to_i
    @labour_type = options['labour_type']
    @rate = options['rate'].to_i
  end

  def save()
    sql = "INSERT INTO hourly_rates (labour_type, rate)
           VALUES
           ('#{labour_type}', #{rate}) RETURNING *"
    rate = SqlRunner.run_sql(sql).first
    return HourlyRate.new(rate)      

  end

  def self.all()
    sql = "SELECT * FROM hourly_rates"
    return HourlyRate.map_items(sql)
  end




  def self.map_items(sql)
    rates = SqlRunner.run_sql(sql)
    result = rates.map { |rate| HourlyRate.new( rate ) }
    return result
  end

  def self.map_item(sql)
    result = HourlyRate.map_items(sql)
    return result.first
  end



end