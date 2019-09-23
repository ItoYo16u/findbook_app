require 'test_helper'

class FollowControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get follow_index_url
    assert_response :success
  end

end
