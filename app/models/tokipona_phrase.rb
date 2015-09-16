class TokiponaPhrase < ActiveRecord::Base

	validates :words, presence: true
	validates :role, presence: true
	has_many :english_phrases

	def length
		words.split.length
	end

end
