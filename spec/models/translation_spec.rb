require 'rails_helper'
require 'attr_spec_helper'

RSpec.describe Translation, type: :model do
	fixtures :documents, :translations

	before do
		@document = Document.create(attributes_for_document documents(:one))
		@translation = @document.translations.new(user_id: 1)
	end

  it "prepares English phrases from document" do  	
  	expect(@translation.english_phrases).to be
  end
end
