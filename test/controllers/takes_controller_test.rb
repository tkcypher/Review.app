require 'test_helper'

class TakesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get takes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get takes_destroy_url
    assert_response :success
  end

end
