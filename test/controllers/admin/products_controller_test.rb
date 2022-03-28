require "test_helper"

class Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_products_index_url
    assert_response :success
  end

  test "should get sale" do
    get admin_products_sale_url
    assert_response :success
  end

  test "should get edit" do
    get admin_products_edit_url
    assert_response :success
  end
end
