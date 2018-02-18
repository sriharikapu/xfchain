require 'test_helper'

class UpcsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @upc = upcs(:one)
  end

  test "should get index" do
    get upcs_url
    assert_response :success
  end

  test "should get new" do
    get new_upc_url
    assert_response :success
  end

  test "should create upc" do
    assert_difference('Upc.count') do
      post upcs_url, params: { upc: {  } }
    end

    assert_redirected_to upc_url(Upc.last)
  end

  test "should show upc" do
    get upc_url(@upc)
    assert_response :success
  end

  test "should get edit" do
    get edit_upc_url(@upc)
    assert_response :success
  end

  test "should update upc" do
    patch upc_url(@upc), params: { upc: {  } }
    assert_redirected_to upc_url(@upc)
  end

  test "should destroy upc" do
    assert_difference('Upc.count', -1) do
      delete upc_url(@upc)
    end

    assert_redirected_to upcs_url
  end
end
