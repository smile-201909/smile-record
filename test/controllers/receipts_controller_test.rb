require 'test_helper'

class ReceiptsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get receipts_show_url
    assert_response :success
  end

  test "should get create" do
    get receipts_create_url
    assert_response :success
  end

end
