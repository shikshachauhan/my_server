require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get createadmin" do
    get :createadmin
    assert_response :success
  end

end
