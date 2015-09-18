require 'rails_helper'
require 'attr_spec_helper'

RSpec.describe TranslationsController, type: :controller do
	fixtures :translations, :documents, :users
  include Devise::TestHelpers
  render_views

	before do
    @jatin = users(:jatin)
    @sonja = users(:sonja)
    @document2 = @jatin.documents.create attributes_for_document(documents(:two))
    @document1 = @jatin.documents.create attributes_for_document(documents(:one))
    @translation1 = @document1.translations.create attributes_for_translation(translations(:one)).merge(user_id: @jatin.id)
    @translation2 = @document2.translations.create attributes_for_translation(translations(:two)).merge(user_id: @jatin.id)
  end

  it "gets index" do
    get :index

    assert_response :success
    expect(assigns(:translations)).to be
  end

  it "gets index for translations of specific document" do
    get :index, document_id: @document1

    assert_response :success
    assigns(:translations).each do |translation|
      expect(translation.document.id).to eq(@document1.id)
    end
  end

  it "gets new translation for document for registered user" do
    sign_in @sonja
    get :new, document_id: @document1

    assert_response :success
  end

  it "redirects unregistered user to login on create attempt" do
    expect {
      post :create, document_id: @document1, translation: { analysis: @translation1.analysis, user_id: @translation1.user_id }
    }.not_to change(Document, :count)
    assert_redirected_to new_user_session_path
  end

  it "creates translation for registered user" do
    sign_in @jatin

    expect {
      post :create, document_id: @document1, translation: { analysis: @translation1.analysis, user_id: @translation1.user_id }
    }.to change(Translation, :count).by(1)

    assert_redirected_to translation_path(assigns(:translation))
  end

  it "shows translation" do
    get :show, id: @translation1
    assert_response :success
  end

  it "redirects unregistered user to login on edit attempt" do
    get :edit, id: @translation1
    assert_redirected_to new_user_session_path
  end

  it "redirects incorrect user to translation on edit attempt" do
    sign_in @sonja
    get :edit, id: @translation1
    assert_redirected_to @translation1
  end

  it "gets edit for correct user" do
    sign_in @jatin
    get :edit, id: @translation1

    assert_response :success
  end

  it "redirects unregistered user to login on update attempt" do
    patch :update, id: @translation1, translation: { analysis: @translation1.analysis, document_id: @translation1.document_id, user_id: @translation1.user_id }
    
    assert_redirected_to new_user_session_path
  end

  it "redirects incorrect user to translation on update attempt" do
    sign_in @sonja
    patch :update, id: @translation1, translation: { analysis: @translation1.analysis, document_id: @translation1.document_id, user_id: @translation1.user_id }
  end

  it "updates translation for correct user" do
    sign_in @jatin
    patch :update, id: @translation1, translation: { analysis: @translation1.analysis, document_id: @translation1.document_id, user_id: @translation1.user_id }
    
    assert_redirected_to translation_path(assigns(:translation))
  end

  it "redirects unregistered user to login on destroy attempt" do
    expect { delete :destroy, id: @translation1 }.not_to change(Translation, :count)
    assert_redirected_to new_user_session_path
  end

  it "redirects incorrect user to translation on destroy attempt" do
    sign_in @sonja

    expect { delete :destroy, id: @translation1 }.not_to change(Translation, :count)
    assert_redirected_to translation_path(@translation1)
  end

  it "destroys translation for correct user" do
    sign_in @jatin

  	expect { delete :destroy, id: @translation1 }.to change(Translation, :count).by(-1)
    assert_redirected_to translations_path
  end
end
