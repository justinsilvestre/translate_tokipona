require 'rails_helper'

RSpec.describe TranslationsController, type: :controller do
	fixtures :translations
	render_views

	before do
    @translation = translations(:one)
  end

  it "gets index" do
    get :index
    assert_response :success
    expect(assigns(:translations)).not_to be_nil
  end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should create translation" do
  #   assert_difference('Translation.count') do
  #     post :create, translation: { analysis: @translation.analysis, document_id: @translation.document_id, user_id: @translation.user_id }
  #   end

  #   assert_redirected_to translation_path(assigns(:translation))
  # end

  it "shows translation" do
    get :show, id: @translation
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: @translation
    assert_response :success
  end

  it "updates translation" do
    patch :update, id: @translation, translation: { analysis: @translation.analysis, document_id: @translation.document_id, user_id: @translation.user_id }
    assert_redirected_to translation_path(assigns(:translation))
  end

  it "destroys translation" do
  	expect { delete :destroy, id: @translation }.to change(Translation, :count).by(-1)

    assert_redirected_to translations_path
  end
end
