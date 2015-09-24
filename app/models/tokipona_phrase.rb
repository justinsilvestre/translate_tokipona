class TokiponaPhrase < ActiveRecord::Base

	validates :words, presence: true
	validates :role, presence: true
	has_many :english_phrases

	def length
		words.split.length
	end

	def self.all_in(phrase_data)
		TokiponaPhrase.where(words: phrase_data.map { |p| p[:word] })
	end

	def self.create_proper_noun(word)
		TokiponaPhrase.create(words: word.capitalize, role: 'pro')
	end
end
