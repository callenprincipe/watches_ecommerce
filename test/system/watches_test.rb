require "application_system_test_case"

class WatchesTest < ApplicationSystemTestCase
  setup do
    @watch = watches(:one)
  end

  test "visiting the index" do
    visit watches_url
    assert_selector "h1", text: "Watches"
  end

  test "should create watch" do
    visit watches_url
    click_on "New watch"

    fill_in "Band width", with: @watch.band_width
    fill_in "Brand", with: @watch.brand_id
    fill_in "Case diameter", with: @watch.case_diameter
    fill_in "Case material", with: @watch.case_material_id
    fill_in "Case thickness", with: @watch.case_thickness
    fill_in "Crystal material", with: @watch.crystal_material_id
    fill_in "Current price", with: @watch.current_price
    fill_in "Dial color", with: @watch.dial_color_id
    fill_in "Model", with: @watch.model_id
    fill_in "Movement type", with: @watch.movement_type_id
    fill_in "Strap material", with: @watch.strap_material_id
    fill_in "Water resistance", with: @watch.water_resistance
    click_on "Create Watch"

    assert_text "Watch was successfully created"
    click_on "Back"
  end

  test "should update Watch" do
    visit watch_url(@watch)
    click_on "Edit this watch", match: :first

    fill_in "Band width", with: @watch.band_width
    fill_in "Brand", with: @watch.brand_id
    fill_in "Case diameter", with: @watch.case_diameter
    fill_in "Case material", with: @watch.case_material_id
    fill_in "Case thickness", with: @watch.case_thickness
    fill_in "Crystal material", with: @watch.crystal_material_id
    fill_in "Current price", with: @watch.current_price
    fill_in "Dial color", with: @watch.dial_color_id
    fill_in "Model", with: @watch.model_id
    fill_in "Movement type", with: @watch.movement_type_id
    fill_in "Strap material", with: @watch.strap_material_id
    fill_in "Water resistance", with: @watch.water_resistance
    click_on "Update Watch"

    assert_text "Watch was successfully updated"
    click_on "Back"
  end

  test "should destroy Watch" do
    visit watch_url(@watch)
    click_on "Destroy this watch", match: :first

    assert_text "Watch was successfully destroyed"
  end
end
