require 'test_helper'

class StocksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get stocks_create_url
    assert_response :success
  end

  test "should get update" do
    get stocks_update_url
    assert_response :success
  end

end
