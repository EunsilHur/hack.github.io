require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get rule" do
    get :rule
    assert_response :success
  end

  test "should get notice" do
    get :notice
    assert_response :success
  end

  test "should get community" do
    get :community
    assert_response :success
  end

end
