require 'test_helper'

class PostLikesControllerTest < ActionController::TestCase
  setup do
    @post_like = post_likes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_likes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_like" do
    assert_difference('PostLike.count') do
      post :create, post_like: { count: @post_like.count, postable_id: @post_like.postable_id }
    end

    assert_redirected_to post_like_path(assigns(:post_like))
  end

  test "should show post_like" do
    get :show, id: @post_like
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_like
    assert_response :success
  end

  test "should update post_like" do
    patch :update, id: @post_like, post_like: { count: @post_like.count, postable_id: @post_like.postable_id }
    assert_redirected_to post_like_path(assigns(:post_like))
  end

  test "should destroy post_like" do
    assert_difference('PostLike.count', -1) do
      delete :destroy, id: @post_like
    end

    assert_redirected_to post_likes_path
  end
end
