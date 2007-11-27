require File.dirname(__FILE__) + '/../test_helper'
require 'date_controller'

# Re-raise errors caught by the controller.
class DateController; def rescue_action(e) raise e end; end

class DateControllerTest < Test::Unit::TestCase
  def setup
    @controller = DateController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
