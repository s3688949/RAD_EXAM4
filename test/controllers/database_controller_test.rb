require 'test_helper'

class DatabaseControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get database_new_url
    assert_response :success
  end

  test "should get create" do
    get database_create_url
    assert_response :success
  end

  test "should get destroy" do
    get database_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get database_edit_url
    assert_response :success
  end

end
