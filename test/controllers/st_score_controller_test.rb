require "test_helper"

class StScoreControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get st_score_home_url
    assert_response :success
  end

  test "should get edit" do
    get st_score_edit_url
    assert_response :success
  end

  test "should get delete" do
    get st_score_delete_url
    assert_response :success
  end
end
