require 'test_helper'

class SubVendorTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_vendor_type = sub_vendor_types(:one)
  end

  test "should get index" do
    get sub_vendor_types_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_vendor_type_url
    assert_response :success
  end

  test "should create sub_vendor_type" do
    assert_difference('SubVendorType.count') do
      post sub_vendor_types_url, params: { sub_vendor_type: { name: @sub_vendor_type.name } }
    end

    assert_redirected_to sub_vendor_type_url(SubVendorType.last)
  end

  test "should show sub_vendor_type" do
    get sub_vendor_type_url(@sub_vendor_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_vendor_type_url(@sub_vendor_type)
    assert_response :success
  end

  test "should update sub_vendor_type" do
    patch sub_vendor_type_url(@sub_vendor_type), params: { sub_vendor_type: { name: @sub_vendor_type.name } }
    assert_redirected_to sub_vendor_type_url(@sub_vendor_type)
  end

  test "should destroy sub_vendor_type" do
    assert_difference('SubVendorType.count', -1) do
      delete sub_vendor_type_url(@sub_vendor_type)
    end

    assert_redirected_to sub_vendor_types_url
  end
end
