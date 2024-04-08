require "test_helper"

class ShoppingCartControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get shopping_cart_add_url
    assert_response :success
  end

  test "should get remove" do
    get shopping_cart_remove_url
    assert_response :success
  end

  test "should get index" do
    get shopping_cart_index_url
    assert_response :success
  end
end
