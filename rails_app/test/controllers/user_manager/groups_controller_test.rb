require "test_helper"

class UserManager::GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group = groups(:one)
  end

  test "should get index" do
    get user_manager_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_user_manager_group_url
    assert_response :success
  end

  test "should create group" do
    assert_difference("Group.count") do
      post user_manager_groups_url, params: { group: { name: @group.name } }
    end

    assert_redirected_to user_manager_group_url(Group.last)
  end

  test "should show group" do
    get user_manager_group_url(@group)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_manager_group_url(@group)
    assert_response :success
  end

  test "should update group" do
    patch user_manager_group_url(@group), params: { group: { name: @group.name } }
    assert_redirected_to user_manager_group_url(@group)
  end

  test "should destroy group" do
    assert_difference("Group.count", -1) do
      delete user_manager_group_url(@group)
    end

    assert_redirected_to user_manager_groups_url
  end
end
