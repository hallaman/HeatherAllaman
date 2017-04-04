require 'test_helper'

class TopicLikesControllerTest < ActionController::TestCase
  setup do
    @topic_like = topic_likes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:topic_likes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create topic_like" do
    assert_difference('TopicLike.count') do
      post :create, topic_like: { count: @topic_like.count, hash_id: @topic_like.hash_id }
    end

    assert_redirected_to topic_like_path(assigns(:topic_like))
  end

  test "should show topic_like" do
    get :show, id: @topic_like
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @topic_like
    assert_response :success
  end

  test "should update topic_like" do
    patch :update, id: @topic_like, topic_like: { count: @topic_like.count, hash_id: @topic_like.hash_id }
    assert_redirected_to topic_like_path(assigns(:topic_like))
  end

  test "should destroy topic_like" do
    assert_difference('TopicLike.count', -1) do
      delete :destroy, id: @topic_like
    end

    assert_redirected_to topic_likes_path
  end
end
