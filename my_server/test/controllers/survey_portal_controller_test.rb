require 'test_helper'

class SurveyPortalControllerTest < ActionController::TestCase
  test "should get listsurvey" do
    get :listsurvey
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get SelectAdmintoLaunchSurvey" do
    get :SelectAdmintoLaunchSurvey
    assert_response :success
  end

  test "should get complete" do
    get :complete
    assert_response :success
  end

  test "should get survey_response" do
    get :survey_response
    assert_response :success
  end

  test "should get survey_question" do
    get :survey_question
    assert_response :success
  end

end
