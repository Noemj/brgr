require 'test_helper'

class BrgrControllerTest < ActionController::TestCase
  test "should get brgr" do
    get :brgr
    assert_response :success
  end

end
