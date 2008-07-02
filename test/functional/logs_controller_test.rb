require 'test_helper'

class LogsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:logs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_log
    assert_difference('Log.count') do
      post :create, :log => { }
    end

    assert_redirected_to log_path(assigns(:log))
  end

  def test_should_show_log
    get :show, :id => logs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => logs(:one).id
    assert_response :success
  end

  def test_should_update_log
    put :update, :id => logs(:one).id, :log => { }
    assert_redirected_to log_path(assigns(:log))
  end

  def test_should_destroy_log
    assert_difference('Log.count', -1) do
      delete :destroy, :id => logs(:one).id
    end

    assert_redirected_to logs_path
  end
end
