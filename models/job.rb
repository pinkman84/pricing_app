require('pg')
require_relative('../db/sql_runner.rb')

class Job
  attr_accessor(:id, :client, :address, :stock_id, :stock_req, :hr_id, :hours_req, :hrs_price, :stock_price)
  def initialize(options)
    @id = options['id']
    @client = options['client']
    @address = options['address']
    @stock_id = options['stock_id'].to_i
    @stock_req = options['stock_req'].to_i
    @hr_id = options['hr_id'].to_i
    @hours_req = options['hours_req'].to_i
  end

  def save()
    sql = "INSERT INTO jobs (client, address, stock_id, stock_req, hr_id, hours_req)
          VALUES
          ('#{@client}', '#{@address}', #{@stock_id}, #{@stock_req}, #{@hr_id}, #{@hours_req}) RETURNING *"
    job = SqlRunner.run_sql(sql).first
    return Job.new(job)  
  end

  def self.all()
    sql = "SELECT * FROM jobs"
    return Job.map_items(sql)
  end

  def stock_price
    sql = "SELECT meter_price FROM stock_levels WHERE id = #{@stock_id}"
    price = SqlRunner.run_sql(sql).first
    return price['meter_price'].to_i
  end

  def hrs_price
    sql = "SELECT rate FROM hourly_rates WHERE id = #{@hr_id}"
    price = SqlRunner.run_sql(sql).first
    return price['rate'].to_i
  end

  def self.map_items(sql)
    jobs = SqlRunner.run_sql(sql)
    result = jobs.map { |job| Job.new( job ) }
    return result
  end

  def self.map_item(sql)
    result = Job.map_items(sql)
    return result.first
  end

end