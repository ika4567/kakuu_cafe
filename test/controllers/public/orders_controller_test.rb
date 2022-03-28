require "test_helper"

class Public::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get note" do
    get public_orders_note_url
    assert_response :success
  end

  test "should get new" do
    get public_orders_new_url
    assert_response :success
  end

  test "should get thanks" do
    get public_orders_thanks_url
    assert_response :success
  end

  test "should get index" do
    get public_orders_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_orders_edit_url
    assert_response :success
  end
end
