require 'test_helper'

class GithubProjectsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:github_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create github_project" do
    assert_difference('GithubProject.count') do
      post :create, :github_project => { }
    end

    assert_redirected_to github_project_path(assigns(:github_project))
  end

  test "should show github_project" do
    get :show, :id => github_projects(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => github_projects(:one).to_param
    assert_response :success
  end

  test "should update github_project" do
    put :update, :id => github_projects(:one).to_param, :github_project => { }
    assert_redirected_to github_project_path(assigns(:github_project))
  end

  test "should destroy github_project" do
    assert_difference('GithubProject.count', -1) do
      delete :destroy, :id => github_projects(:one).to_param
    end

    assert_redirected_to github_projects_path
  end
end
