#encoding: utf-8

require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  
  setup do
    @product = products(:one)
    @valid_product_data = {
      :title => 'Lorem Ipsum',
      :description => 'Dolor sit amet!',
      :image_url => 'lorem.jpg',
      :price => 19.90
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
    assert_select '#product_list tr', 3
    products.each do |prod|
      assert_select 'dt', prod.title
    end
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: @valid_product_data
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product.to_param
    assert_response :success
  end

  test "should update product" do
    put :update, id: @product.to_param, product: @valid_product_data
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product.to_param
    end

    assert_redirected_to products_path
  end
  
end
