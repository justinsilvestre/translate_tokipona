require 'rails_helper'
require 'attr_spec_helper'

RSpec.describe EnglishPhrase, type: :model do
	fixtures :users, :documents

	before do
		@document = users(:jatin).documents.create(attributes_for_document documents(:one))
	end

  it "gives phrases for each Toki Pona phrase in a document" do
  	expect(EnglishPhrase.all_in @document.phrases).not_to be_nil
  end
end
