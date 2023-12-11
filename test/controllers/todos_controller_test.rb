require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = todos(:one)
  end

  test "should get index" do
    get todos_url
    assert_response :success
  end

  test "should get new" do
    get new_todo_url
    assert_response :success
  end

  test "should create todo" do
    assert_difference("Todo.count") do
      post todos_url, params: { todo: { item: @todo.item, purchased: @todo.purchased } }
    end

    assert_redirected_to todo_url(Todo.last)
  end

  # Functional test to ensure image functionality is working as expected
  test "should create todo with image" do
    # Path to image in fixtures
    image_path = Rails.root.join('test', 'fixtures', 'files', 'sample_image.jpg')

    assert_difference("Todo.count") do
      # fixture_file_upload simulates uploading an image to a todo
      post todos_url, params: { todo: { item: @todo.item, purchased: @todo.purchased, image: fixture_file_upload(image_path, 'image/jpeg') } }
    end

    assert_redirected_to todo_url(Todo.last)
    # Checks that the image added is equal to value stored in the image column of the last todo that was created and checks it's a jpg
    assert_equal 'image/jpeg', Todo.last.image.content_type
  end

  test "should show todo" do
    get todo_url(@todo)
    assert_response :success
  end

  test "should get edit" do
    get edit_todo_url(@todo)
    assert_response :success
  end

  test "should update todo" do
    patch todo_url(@todo), params: { todo: { item: @todo.item, purchased: @todo.purchased } }
    assert_redirected_to todo_url(@todo)
  end

  test "should destroy todo" do
    assert_difference("Todo.count", -1) do
      delete todo_url(@todo)
    end

    assert_redirected_to todos_url
  end
end
