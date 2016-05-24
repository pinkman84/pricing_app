require('minitest/autorun')
require('minitest/rg')
require_relative('../models/job.rb')
require_relative('../models/hourly_rate.rb')
require_relative('../models/stock.rb')

class TestJob < Minitest::Test

  def setup
    options = {
      'client' => 'Code Clan',
      'address' => 'Castle Terrace',
      'amount' => 1000
    }
    
    @job = Job.new(options)
  end

  def test_client
    assert_equal('Code Clan', @job.client)
  end

  def test_address
    assert_equal('Castle Terrace', @job.address)
  end

  def test_amount
    assert_equal(1000, @job.amount)
  end

end