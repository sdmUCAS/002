require 'test_helper'

class UncheckOrdersControllerTest < ActionController::TestCase
  setup do
    @uncheck_order = uncheck_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uncheck_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uncheck_order" do
    assert_difference('UncheckOrder.count') do
      post :create, uncheck_order: {  }
    end

    assert_redirected_to uncheck_order_path(assigns(:uncheck_order))
  end

  test "should show uncheck_order" do
    get :show, id: @uncheck_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @uncheck_order
    assert_response :success
  end

  test "should update uncheck_order" do
    patch :update, id: @uncheck_order, uncheck_order: {  }
    assert_redirected_to uncheck_order_path(assigns(:uncheck_order))
  end

  test "should destroy uncheck_order" do
    assert_difference('UncheckOrder.count', -1) do
      delete :destroy, id: @uncheck_order
    end

    assert_redirected_to uncheck_orders_path
  end
end
