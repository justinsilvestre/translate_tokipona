class EnglishPhrasesController < ApplicationController
	def from_tokipona
		@english_phrases = EnglishPhrase.from_tokipona(params[:tokipona_phrase_id])
	end
end
