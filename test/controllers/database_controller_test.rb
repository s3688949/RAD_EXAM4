require 'test_helper'

class DatabaseControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get database_index_url
    assert_response :success
  end

  test "should get show" do
    get database_show_url
    assert_response :success
  end

  test "should get edit" do
    get database_edit_url
    assert_response :success
  end

  test "should get update" do
    get database_update_url
    assert_response :success
  end

  test "should get new" do
    get database_new_url
    assert_response :success
  end

end
