require 'test_helper'

class ApiListControllerTest < ActionDispatch::IntegrationTest
  test "should get getinfo" do
    get api_list_getinfo_url
    assert_response :success
  end

end
