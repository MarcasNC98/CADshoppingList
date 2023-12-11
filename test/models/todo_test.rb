require "test_helper"

class TodoTest < ActiveSupport::TestCase
  # Unit tests for creating, showing, editing and deleting items, basis for tests from Week 9 Lesson
  setup do
  end

  # Creates a new item and checks if it is saved
  test "Save item" do
    to_buy = Todo.new
    assert to_buy.save
  end

  # Creates a new item and tests the find functionality
  test "Find item" do
    to_buy = Todo.new()
    to_buy.item = "Carrots"
    to_buy.purchased = true
    to_buy.save

    expected_item = Todo.find(to_buy.id)
    assert_equal(expected_item.item, to_buy.item)
    assert_equal(expected_item.purchased, to_buy.purchased)
  end

  # Creates an item and deletes it
  test "Delete item" do
    to_buy = Todo.new()
    to_buy.save
    assert_difference("Todo.count", -1) do
      to_buy.destroy
    end
  end

  # Retrieves the buy_beans from fixtures and tests the update functionality
  test "Update item" do
    buy_beans = todos(:buy_beans)
    beans_update_item = "Buy Heinz beans"
    buy_beans.update({
      item:beans_update_item
    })
    assert_equal(beans_update_item, buy_beans.item)
  end

  # Ensures that the 'purchased: true' field reads as 'Purchased' when true
  test "Purchased true" do
    buy_beans = todos(:buy_beans)
    assert_equal(buy_beans.get_item_status, "Purchased")
  end

  # Ensures that the 'purchased: false' field reads as 'Yet to buy' when false
  test "Purchased false" do
    buy_soda = todos(:buy_soda)
    assert_equal(buy_soda.get_item_status, "Yet to buy")
  end

  teardown do
  end
end