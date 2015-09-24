require 'rails_helper'
require 'attr_spec_helper'

RSpec.describe DocumentsController, type: :controller do
	fixtures :documents, :users
  include Devise::TestHelpers
	render_views

  before do
    @jatin = users(:jatin)
    @sonja = users(:sonja)
    @document = @jatin.documents.create attributes_for_document(documents(:one))
  end

  it "gets index" do
    get :index

    assert_response :success
    expect(:documents).to be
  end

  # it "gets new" do
  #   get :new

  #   assert_response :success
  # end

  it "redirects unregistered user to login on create attempt" do
    expect { post :create, document: { analysis: @document.analysis, original_text: @document.original_text, source: @document.source, title: @document.title, url: @document.url, user_id: @document.user_id } }
    	.not_to change(Document, :count)
    assert_redirected_to new_user_session_path
  end

  it "creates document for registered user" do
    sign_in @jatin

    expect { post :create, document: { analysis: @document.analysis, original_text: @document.original_text, source: @document.source, title: @document.title, url: @document.url, user_id: @document.user_id } }
      .to change(Document, :count).by(1)
  end

  it "shows document" do
    get :show, id: @document

    assert_response :success
  end

  it "redirects unregistered user to login on edit attempt" do
    get :edit, id: @document
    assert_redirected_to new_user_session_path
  end

  it "redirects incorrect user to document on edit attempt" do
    sign_in @sonja
    get :edit, id: @document

    expect(flash).not_to be_empty
  end

  it "gets edit for correct user" do
    sign_in @jatin
    get :edit, id: @document

    assert_response :success
  end

  it "redirects unregistered user to login on update attempt" do
    patch :update, id: @document, document: { analysis: @document.analysis, original_text: @document.original_text, source: @document.source, title: @document.title, url: @document.url }
    
    assert_redirected_to new_user_session_path
  end

  it "does not update for incorrect user" do
    sign_in @sonja
    patch :update, id: @document, document: { analysis: @document.analysis, original_text: @document.original_text, source: @document.source, title: @document.title, url: @document.url }
    
    assert_redirected_to document_path(assigns(:document))
    expect(flash[:error]).to be
  end

  it "updates for correct user" do
    sign_in @jatin
    patch :update, id: @document, document: { analysis: @document.analysis, original_text: @document.original_text, source: @document.source, title: @document.title, url: @document.url }
    
    assert_redirected_to document_path(assigns(:document))
    expect(flash[:success]).to be
  end

  it "does not destroy for incorrect user" do
    sign_in @sonja
    expect { delete :destroy, id: @document }.not_to change(Document, :count)
    assert_redirected_to document_path(assigns(:document))
    expect(flash[:error]).to be
  end

  it "destroys document for correct user" do
    sign_in @jatin
    expect { delete :destroy, id: @document }.to change(Document, :count).by(-1)
    assert_redirected_to documents_path
  end
end
