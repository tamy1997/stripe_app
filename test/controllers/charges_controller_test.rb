require "test_helper"

class ChargesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get charges_new_url
    assert_response :success
  end
end
