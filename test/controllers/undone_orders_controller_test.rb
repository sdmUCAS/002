require 'test_helper'

class UndoneOrdersControllerTest < ActionController::TestCase
  setup do
    @undone_order = undone_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:undone_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create undone_order" do
    assert_difference('UndoneOrder.count') do
      post :create, undone_order: {  }
    end

    assert_redirected_to undone_order_path(assigns(:undone_order))
  end

  test "should show undone_order" do
    get :show, id: @undone_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @undone_order
    assert_response :success
  end

  test "should update undone_order" do
    patch :update, id: @undone_order, undone_order: {  }
    assert_redirected_to undone_order_path(assigns(:undone_order))
  end

  test "should destroy undone_order" do
    assert_difference('UndoneOrder.count', -1) do
      delete :destroy, id: @undone_order
    end

    assert_redirected_to undone_orders_path
  end
end
