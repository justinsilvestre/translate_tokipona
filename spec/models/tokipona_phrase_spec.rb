require 'rails_helper'

RSpec.describe TokiponaPhrase, type: :model do
  fixtures :tokipona_phrases

  before do
  	@olin_t = tokipona_phrases :olin_t
  end

  it "creates a new proper noun from a capitalized word" do
  	mewika = TokiponaPhrase.create_proper_noun("Mewika")
  	expect(mewika.words).to eq("Mewika")
  end
end
