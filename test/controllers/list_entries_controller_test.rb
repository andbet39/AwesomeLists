require 'test_helper'

class ListEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list_entry = list_entries(:one)
  end

  test "should get index" do
    get list_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_list_entry_url
    assert_response :success
  end

  test "should create list_entry" do
    assert_difference('ListEntry.count') do
      post list_entries_url, params: { list_entry: { category: @list_entry.category, description: @list_entry.description, list_id: @list_entry.list_id, subcategory: @list_entry.subcategory, title: @list_entry.title, url: @list_entry.url } }
    end

    assert_redirected_to list_entry_url(ListEntry.last)
  end

  test "should show list_entry" do
    get list_entry_url(@list_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_list_entry_url(@list_entry)
    assert_response :success
  end

  test "should update list_entry" do
    patch list_entry_url(@list_entry), params: { list_entry: { category: @list_entry.category, description: @list_entry.description, list_id: @list_entry.list_id, subcategory: @list_entry.subcategory, title: @list_entry.title, url: @list_entry.url } }
    assert_redirected_to list_entry_url(@list_entry)
  end

  test "should destroy list_entry" do
    assert_difference('ListEntry.count', -1) do
      delete list_entry_url(@list_entry)
    end

    assert_redirected_to list_entries_url
  end
end
