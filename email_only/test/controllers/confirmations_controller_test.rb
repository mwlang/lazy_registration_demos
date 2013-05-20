require 'test_helper'

class PagesControllerTest < ActionController::TestCase

  test "should be a child of Devise::ConfirmationsController" do
    assert_equal controller.class.superclass, Devise::ConfirmationsController
  end
end
