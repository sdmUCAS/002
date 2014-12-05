require 'test_helper'

class ProviderOrdersControllerTest < ActionController::TestCase
  setup do
    @provider_order = provider_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:provider_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create provider_order" do
    assert_difference('ProviderOrder.count') do
      post :create, provider_order: {  }
    end

    assert_redirected_to provider_order_path(assigns(:provider_order))
  end

  test "should show provider_order" do
    get :show, id: @provider_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @provider_order
    assert_response :success
  end

  test "should update provider_order" do
    patch :update, id: @provider_order, provider_order: {  }
    assert_redirected_to provider_order_path(assigns(:provider_order))
  end

  test "should destroy provider_order" do
    assert_difference('ProviderOrder.count', -1) do
      delete :destroy, id: @provider_order
    end

    assert_redirected_to provider_orders_path
  end
end
