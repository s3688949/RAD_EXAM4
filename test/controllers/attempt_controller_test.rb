require 'test_helper'

class AttemptControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get attempt_new_url
    assert_response :success
  end

  test "should get create" do
    get attempt_create_url
    assert_response :success
  end

  test "should get destroy" do
    get attempt_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get attempt_edit_url
    assert_response :success
  end

end
