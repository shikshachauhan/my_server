require 'test_helper'

class LocationControllerTest < ActionController::TestCase
  test "should get getlocation" do
    get :getlocation
    assert_response :success
  end

end
