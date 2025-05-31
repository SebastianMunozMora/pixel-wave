require "test_helper"

class TemplatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get templates_index_url
    assert_response :success
  end

  test "should get minimalist" do
    get templates_minimalist_url
    assert_response :success
  end

  test "should get vibrant" do
    get templates_vibrant_url
    assert_response :success
  end

  test "should get elegant" do
    get templates_elegant_url
    assert_response :success
  end
end
