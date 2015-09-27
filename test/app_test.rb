require File.expand_path '../test_helper.rb', __FILE__

class MyTest < MiniTest::Unit::TestCase

  include Rack::Test::Methods

  def app
    EngineeringApp
  end

  def test_index
    get '/'
    assert last_response.ok?
    assert_match "Bright Funds Engineering Application", last_response.body
  end
end