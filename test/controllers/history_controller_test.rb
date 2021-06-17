require 'test_helper'

class HistoryControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get history_new_url
    assert_response :success
  end

  test "should get create" do
    get history_create_url
    assert_response :success
  end

  test "should get destroy" do
    get history_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get history_edit_url
    assert_response :success
  end

end
