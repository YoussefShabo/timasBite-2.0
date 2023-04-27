require "application_system_test_case"

class BitesTest < ApplicationSystemTestCase
  setup do
    @bite = bites(:one)
  end

  test "visiting the index" do
    visit bites_url
    assert_selector "h1", text: "Bites"
  end

  test "should create bite" do
    visit bites_url
    click_on "New bite"

    fill_in "Description", with: @bite.description
    fill_in "Image", with: @bite.image
    fill_in "Name", with: @bite.name
    fill_in "Price", with: @bite.price
    click_on "Create Bite"

    assert_text "Bite was successfully created"
    click_on "Back"
  end

  test "should update Bite" do
    visit bite_url(@bite)
    click_on "Edit this bite", match: :first

    fill_in "Description", with: @bite.description
    fill_in "Image", with: @bite.image
    fill_in "Name", with: @bite.name
    fill_in "Price", with: @bite.price
    click_on "Update Bite"

    assert_text "Bite was successfully updated"
    click_on "Back"
  end

  test "should destroy Bite" do
    visit bite_url(@bite)
    click_on "Destroy this bite", match: :first

    assert_text "Bite was successfully destroyed"
  end
end
