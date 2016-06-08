require 'test_helper'

class LoginPortalControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get invalid" do
    get :invalid
    assert_response :success
  end

end
