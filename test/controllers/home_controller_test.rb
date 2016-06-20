require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get board" do
    get :board
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

end
