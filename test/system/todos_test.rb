require "application_system_test_case"

class TodosTest < ApplicationSystemTestCase
  setup do
    @todo = todos(:one)
  end

  test "visiting the index" do
    visit todos_url
    assert_selector "h1", text: "Items"
  end

  test "should create Item" do
    visit todos_url
    click_on "New item"

    fill_in "Item", with: @todo.item
    check "Purchased" if @todo.purchased
    click_on "Create item"

    assert_text "Item was successfully created."
    click_on "Back"
  end

  test "should update Item" do
    visit todo_url(@todo)
    click_on "Edit this item", match: :first

    fill_in "Item", with: @todo.item
    check "Purchased" if @todo.purchased
    click_on "Update item"

    assert_text "Item was successfully updated."
    click_on "Back"
  end

  test "should destroy Item" do
    visit todo_url(@todo)
    click_on "Delete this item", match: :first

    assert_text "Item was successfully deleted."
  end
end
