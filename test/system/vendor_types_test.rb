require "application_system_test_case"

class VendorTypesTest < ApplicationSystemTestCase
  setup do
    @vendor_type = vendor_types(:one)
  end

  test "visiting the index" do
    visit vendor_types_url
    assert_selector "h1", text: "Vendor Types"
  end

  test "creating a Vendor type" do
    visit vendor_types_url
    click_on "New Vendor Type"

    fill_in "Name", with: @vendor_type.name
    click_on "Create Vendor type"

    assert_text "Vendor type was successfully created"
    click_on "Back"
  end

  test "updating a Vendor type" do
    visit vendor_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @vendor_type.name
    click_on "Update Vendor type"

    assert_text "Vendor type was successfully updated"
    click_on "Back"
  end

  test "destroying a Vendor type" do
    visit vendor_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vendor type was successfully destroyed"
  end
end
