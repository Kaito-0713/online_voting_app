require "test_helper"

class ElectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get elections_index_url
    assert_response :success
  end

  test "should get show" do
    get elections_show_url
    assert_response :success
  end

  test "should get new" do
    get elections_new_url
    assert_response :success
  end

  test "should get create" do
    get elections_create_url
    assert_response :success
  end

  test "should get edit" do
    get elections_edit_url
    assert_response :success
  end

  test "should get update" do
    get elections_update_url
    assert_response :success
  end

  test "should get destroy" do
    get elections_destroy_url
    assert_response :success
  end
end
