require 'test_helper'

class CoisasControllerTest < ActionController::TestCase
  setup do
    @coisa = coisas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coisas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coisa" do
    assert_difference('Coisa.count') do
      post :create, :coisa => { :descricao => @coisa.descricao, :nome => @coisa.nome, :tags => @coisa.tags }
    end

    assert_redirected_to coisa_path(assigns(:coisa))
  end

  test "should show coisa" do
    get :show, :id => @coisa
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @coisa
    assert_response :success
  end

  test "should update coisa" do
    put :update, :id => @coisa, :coisa => { :descricao => @coisa.descricao, :nome => @coisa.nome, :tags => @coisa.tags }
    assert_redirected_to coisa_path(assigns(:coisa))
  end

  test "should destroy coisa" do
    assert_difference('Coisa.count', -1) do
      delete :destroy, :id => @coisa
    end

    assert_redirected_to coisas_path
  end
end
