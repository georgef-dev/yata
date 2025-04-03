require "test_helper"

class TodoControllerTest < ActionDispatch::IntegrationTest
  test "should get todo" do
    get todo_todo_url
    assert_response :success
  end
end
