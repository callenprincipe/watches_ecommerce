require "test_helper"

class WatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @watch = watches(:one)
  end

  test "should get index" do
    get watches_url
    assert_response :success
  end

  test "should get new" do
    get new_watch_url
    assert_response :success
  end

  test "should create watch" do
    assert_difference("Watch.count") do
      post watches_url, params: { watch: { band_width: @watch.band_width, brand_id: @watch.brand_id, case_diameter: @watch.case_diameter, case_material_id: @watch.case_material_id, case_thickness: @watch.case_thickness, crystal_material_id: @watch.crystal_material_id, current_price: @watch.current_price, dial_color_id: @watch.dial_color_id, model_id: @watch.model_id, movement_type_id: @watch.movement_type_id, strap_material_id: @watch.strap_material_id, water_resistance: @watch.water_resistance } }
    end

    assert_redirected_to watch_url(Watch.last)
  end

  test "should show watch" do
    get watch_url(@watch)
    assert_response :success
  end

  test "should get edit" do
    get edit_watch_url(@watch)
    assert_response :success
  end

  test "should update watch" do
    patch watch_url(@watch), params: { watch: { band_width: @watch.band_width, brand_id: @watch.brand_id, case_diameter: @watch.case_diameter, case_material_id: @watch.case_material_id, case_thickness: @watch.case_thickness, crystal_material_id: @watch.crystal_material_id, current_price: @watch.current_price, dial_color_id: @watch.dial_color_id, model_id: @watch.model_id, movement_type_id: @watch.movement_type_id, strap_material_id: @watch.strap_material_id, water_resistance: @watch.water_resistance } }
    assert_redirected_to watch_url(@watch)
  end

  test "should destroy watch" do
    assert_difference("Watch.count", -1) do
      delete watch_url(@watch)
    end

    assert_redirected_to watches_url
  end
end
