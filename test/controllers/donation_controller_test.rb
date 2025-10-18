require "test_helper"

class DonationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get donation_index_url
    assert_response :success
  end

  test "should get thank_you" do
    get donation_thank_you_url
    assert_response :success
  end

  test "should get try_again" do
    get donation_try_again_url
    assert_response :success
  end
end
