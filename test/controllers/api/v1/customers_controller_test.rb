require "test_helper"

class Api::V1::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_customers_create_url
    assert_response :success
  end
end
