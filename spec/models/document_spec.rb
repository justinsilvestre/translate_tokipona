require 'rails_helper'
require 'attr_spec_helper'

RSpec.describe Document, type: :model do
  fixtures :users, :documents

  before do
  	@document1 = documents(:one)
  	@jatin = users(:jatin)
  end

  it "is invalid without original text" do
  	document = new_document(original_text: nil)
  	expect(document).to be_invalid
  end

  it "is valid with original text" do
  	document = new_document
  	expect(document).to be_valid
  end

  it "is invalid without title" do
		document = new_document(title: nil)
		expect(document).to be_invalid
  end

  it "is valid with title" do
		document = new_document
		expect(document).to be_valid
  end

  it "generates analysis on save" do
  	document = new_document
  	document.save

  	expect(document.analysis).to be
  end

  it "generates unlisted proper nouns on save" do
  	document = new_document(original_text: 'mi olin e ma Mewika.')
  	document.save

  	expect(document.phrases.map(&:words)).to include('Mewika')
  end

  it "gives list of phrases based on analysis" do
  	document = new_document
  	document.save

  	expect(document.phrases).to be
  end

  def new_document(changed_attributes={})
		attributes = attributes_for_document(@document1).merge(changed_attributes)

		@jatin.documents.new(attributes)
  end
end
