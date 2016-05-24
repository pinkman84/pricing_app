require('pg')
require_relative('../db/sql_runner.rb')

class Stock
  attr_accessor(:id, :stock_type, :stock_level, :meter_price, :add_stock)
  def initialize(options)
    @id = options['id'].to_i
    @stock_type = options['stock_type']
    @stock_level = options['stock_level'].to_i
    @meter_price = options['meter_price'].to_i
  end

  def save()
    sql = "INSERT INTO stock_levels 
          (stock_type, stock_level, meter_price)
          VALUES
          ('#{stock_type}', #{stock_level}, #{meter_price}) RETURNING * "
     stock = SqlRunner.run_sql(sql).first
     return Stock.new(stock)     
  end

  
  def self.all()
    sql = "SELECT * FROM stock_levels"
    return Stock.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM stock_levels WHERE id = #{id}"
    stocks = SqlRunner.run_sql(sql)
    result = stocks.map { |s| Stock.new(s)}
    return result.first
  end

  def add_stock(options)
    sql = "UPDATE stock_levels SET stock_level = stock_level + #{options} WHERE id = #{@id}"
    SqlRunner.run_sql(sql)
  end


  def self.map_items(sql)
    stocks = SqlRunner.run_sql(sql)
    result = stocks.map { |stock| Stock.new( stock ) }
    return result
  end

  def self.map_item(sql)
    result = Stock.map_items(sql)
    return result.first
  end

end


