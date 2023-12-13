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

    # Because of the validation logic that prevents duplicate data being saved, test will check if this functionality works correctly
    assert_text "1 error prohibited this item from being saved:"
    assert_text "Item is already on the list"
    click_on "Back"
  end

  test "should update Item" do
    visit todo_url(@todo)
    click_on "Edit this item", match: :first

    fill_in "Item", with: @todo.item
    check "Purchased" if @todo.purchased
    click_on "Create item"

    assert_text "1 error prohibited this item from being saved:"
    assert_text "Item is already on the list"
  end

  test "should destroy Item" do
    visit todo_url(@todo)
    click_on "Delete this item", match: :first
    accept_confirm do
      # Will click 'ok' on the alert
    end

    assert_text "Item was successfully deleted."
  end
end
