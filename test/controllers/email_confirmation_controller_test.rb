require 'test_helper'

class EmailConfirmationControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get email_confirmation_show_url
    assert_response :success
  end

end
