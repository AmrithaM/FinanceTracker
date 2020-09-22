require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get my_stockfolio" do
    get users_my_stockfolio_url
    assert_response :success
  end

end
