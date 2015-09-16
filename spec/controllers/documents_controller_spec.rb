require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do
	fixtures :documents
	render_views

  before do
    @document = documents(:one)
  end

  it "gets index" do
    get :index
    assert_response :success
    expect(:documents).not_to be_nil
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates document" do
    expect { post :create, document: { analysis: @document.analysis, original_text: @document.original_text, source: @document.source, title: @document.title, url: @document.url, user_id: @document.user_id } }
    	.to change(Document, :count).by(1)
    assert_redirected_to document_path(assigns(:document))
  end

  it "shows document" do
    get :show, id: @document
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: @document
    assert_response :success
  end

  it "updates document" do
    patch :update, id: @document, document: { analysis: @document.analysis, original_text: @document.original_text, source: @document.source, title: @document.title, url: @document.url, user_id: @document.user_id }
    assert_redirected_to document_path(assigns(:document))
  end

  it "destroys document" do
    expect { delete :destroy, id: @document }.to change(Document, :count).by(-1)
    assert_redirected_to documents_path
  end
end
