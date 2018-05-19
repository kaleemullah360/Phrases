require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get main_list_url
    assert_response :success
  end

end
