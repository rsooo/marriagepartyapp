require 'test_helper'

class NamesControllerTest < ActionController::TestCase
  setup do
    @name = names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create name" do
    assert_difference('Name.count') do
      post :create, name: { comment: @name.comment, q10: @name.q10, q1: @name.q1, q2: @name.q2, q3: @name.q3, q4: @name.q4, q5: @name.q5, q6: @name.q6, q7: @name.q7, q8: @name.q8, q9: @name.q9 }
    end

    assert_redirected_to name_path(assigns(:name))
  end

  test "should show name" do
    get :show, id: @name
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @name
    assert_response :success
  end

  test "should update name" do
    patch :update, id: @name, name: { comment: @name.comment, q10: @name.q10, q1: @name.q1, q2: @name.q2, q3: @name.q3, q4: @name.q4, q5: @name.q5, q6: @name.q6, q7: @name.q7, q8: @name.q8, q9: @name.q9 }
    assert_redirected_to name_path(assigns(:name))
  end

  test "should destroy name" do
    assert_difference('Name.count', -1) do
      delete :destroy, id: @name
    end

    assert_redirected_to names_path
  end
end
