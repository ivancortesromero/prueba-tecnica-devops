require "test_helper"

class LargestRangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @largest_range = largest_ranges(:one)
  end

  test "should get index" do
    get largest_ranges_url, as: :json
    assert_response :success
  end

  test "should create largest_range" do
    assert_difference('LargestRange.count') do
      post largest_ranges_url, params: { largest_range: { end_array: @largest_range.end_array } }, as: :json
    end

    assert_response 201
  end

  test "should show largest_range" do
    get largest_range_url(@largest_range), as: :json
    assert_response :success
  end

  test "should update largest_range" do
    patch largest_range_url(@largest_range), params: { largest_range: { end_array: @largest_range.end_array } }, as: :json
    assert_response 200
  end

  test "should destroy largest_range" do
    assert_difference('LargestRange.count', -1) do
      delete largest_range_url(@largest_range), as: :json
    end

    assert_response 204
  end
end
