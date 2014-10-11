require 'test_helper'

class AccPhotosControllerTest < ActionController::TestCase
  setup do
    @acc_photo = acc_photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:acc_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acc_photo" do
    assert_difference('AccPhoto.count') do
      post :create, acc_photo: { account_id: @acc_photo.account_id, default: @acc_photo.default, photo: @acc_photo.photo }
    end

    assert_redirected_to acc_photo_path(assigns(:acc_photo))
  end

  test "should show acc_photo" do
    get :show, id: @acc_photo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @acc_photo
    assert_response :success
  end

  test "should update acc_photo" do
    patch :update, id: @acc_photo, acc_photo: { account_id: @acc_photo.account_id, default: @acc_photo.default, photo: @acc_photo.photo }
    assert_redirected_to acc_photo_path(assigns(:acc_photo))
  end

  test "should destroy acc_photo" do
    assert_difference('AccPhoto.count', -1) do
      delete :destroy, id: @acc_photo
    end

    assert_redirected_to acc_photos_path
  end
end
