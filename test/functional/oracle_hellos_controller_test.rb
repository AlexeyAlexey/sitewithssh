require 'test_helper'

class OracleHellosControllerTest < ActionController::TestCase
  setup do
    @oracle_hello = oracle_hellos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:oracle_hellos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create oracle_hello" do
    assert_difference('OracleHello.count') do
      post :create, oracle_hello: {  }
    end

    assert_redirected_to oracle_hello_path(assigns(:oracle_hello))
  end

  test "should show oracle_hello" do
    get :show, id: @oracle_hello
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @oracle_hello
    assert_response :success
  end

  test "should update oracle_hello" do
    put :update, id: @oracle_hello, oracle_hello: {  }
    assert_redirected_to oracle_hello_path(assigns(:oracle_hello))
  end

  test "should destroy oracle_hello" do
    assert_difference('OracleHello.count', -1) do
      delete :destroy, id: @oracle_hello
    end

    assert_redirected_to oracle_hellos_path
  end
end
