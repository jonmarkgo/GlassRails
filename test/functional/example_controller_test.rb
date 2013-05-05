require 'test_helper'

class ExampleControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get add_card" do
    get :add_card
    assert_response :success
  end

  test "should get get_location" do
    get :get_location
    assert_response :success
  end

end
