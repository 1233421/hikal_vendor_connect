require "application_system_test_case"

class SubVendorTypesTest < ApplicationSystemTestCase
  setup do
    @sub_vendor_type = sub_vendor_types(:one)
  end

  test "visiting the index" do
    visit sub_vendor_types_url
    assert_selector "h1", text: "Sub Vendor Types"
  end

  test "creating a Sub vendor type" do
    visit sub_vendor_types_url
    click_on "New Sub Vendor Type"

    fill_in "Name", with: @sub_vendor_type.name
    click_on "Create Sub vendor type"

    assert_text "Sub vendor type was successfully created"
    click_on "Back"
  end

  test "updating a Sub vendor type" do
    visit sub_vendor_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @sub_vendor_type.name
    click_on "Update Sub vendor type"

    assert_text "Sub vendor type was successfully updated"
    click_on "Back"
  end

  test "destroying a Sub vendor type" do
    visit sub_vendor_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sub vendor type was successfully destroyed"
  end
end
