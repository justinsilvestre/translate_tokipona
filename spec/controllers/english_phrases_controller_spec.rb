require 'rails_helper'

RSpec.describe EnglishPhrasesController, type: :controller do
	fixtures :tokipona_phrases
	fixtures :english_phrases

	before do
		@english_phrase1 = english_phrases(:english_phrase1)
		@olin_t = tokipona_phrases(:olin_t)
	end

	it "fetches English phrases for a given Toki Pona phrase" do
		get :from_tokipona, tokipona_phrase_id: @olin_t, format: :json

		expect(assigns(:english_phrases)).to be
	end

end
