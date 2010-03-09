require 'test_helper'

class LogBookEntriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:log_book_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create log_book_entry" do
    assert_difference('LogBookEntry.count') do
      post :create, :log_book_entry => { }
    end

    assert_redirected_to log_book_entry_path(assigns(:log_book_entry))
  end

  test "should show log_book_entry" do
    get :show, :id => log_book_entries(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => log_book_entries(:one).to_param
    assert_response :success
  end

  test "should update log_book_entry" do
    put :update, :id => log_book_entries(:one).to_param, :log_book_entry => { }
    assert_redirected_to log_book_entry_path(assigns(:log_book_entry))
  end

  test "should destroy log_book_entry" do
    assert_difference('LogBookEntry.count', -1) do
      delete :destroy, :id => log_book_entries(:one).to_param
    end

    assert_redirected_to log_book_entries_path
  end
end
