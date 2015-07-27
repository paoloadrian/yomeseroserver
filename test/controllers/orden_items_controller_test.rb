require 'test_helper'

class OrdenItemsControllerTest < ActionController::TestCase
  setup do
    @orden_item = orden_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orden_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orden_item" do
    assert_difference('OrdenItem.count') do
      post :create, orden_item: { cantidad: @orden_item.cantidad, id_item: @orden_item.id_item }
    end

    assert_redirected_to orden_item_path(assigns(:orden_item))
  end

  test "should show orden_item" do
    get :show, id: @orden_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orden_item
    assert_response :success
  end

  test "should update orden_item" do
    patch :update, id: @orden_item, orden_item: { cantidad: @orden_item.cantidad, id_item: @orden_item.id_item }
    assert_redirected_to orden_item_path(assigns(:orden_item))
  end

  test "should destroy orden_item" do
    assert_difference('OrdenItem.count', -1) do
      delete :destroy, id: @orden_item
    end

    assert_redirected_to orden_items_path
  end
end
