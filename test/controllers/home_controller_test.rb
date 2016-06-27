require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get board" do
    get :agile_board
    assert_response :success
  end

end
