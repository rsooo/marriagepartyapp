require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  setup do
    @answer = answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create answer" do
    assert_difference('Answer.count') do
      post :create, answer: { comment: @answer.comment, name: @answer.name, q10: @answer.q10, q1: @answer.q1, q2: @answer.q2, q3: @answer.q3, q4: @answer.q4, q5: @answer.q5, q6: @answer.q6, q7: @answer.q7, q8: @answer.q8, q9: @answer.q9 }
    end

    assert_redirected_to answer_path(assigns(:answer))
  end

  test "should show answer" do
    get :show, id: @answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @answer
    assert_response :success
  end

  test "should update answer" do
    patch :update, id: @answer, answer: { comment: @answer.comment, name: @answer.name, q10: @answer.q10, q1: @answer.q1, q2: @answer.q2, q3: @answer.q3, q4: @answer.q4, q5: @answer.q5, q6: @answer.q6, q7: @answer.q7, q8: @answer.q8, q9: @answer.q9 }
    assert_redirected_to answer_path(assigns(:answer))
  end

  test "should destroy answer" do
    assert_difference('Answer.count', -1) do
      delete :destroy, id: @answer
    end

    assert_redirected_to answers_path
  end
end
