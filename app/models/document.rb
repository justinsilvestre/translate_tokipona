class Document < ActiveRecord::Base
	require 'tokipona'
	require 'json'
	include GrammarHelper

  belongs_to :user
  has_many :translations, dependent: :destroy

  validates :title, presence: true
  validates :original_text, presence: true

  before_save :prepare_analysis, :create_proper_nouns

  def phrases
   TokiponaPhrase.all_in phrase_data
  end

  def english_phrases
    EnglishPhrase.all_in phrases
  end

  def map_sentences
    parsed_analysis.map do |sentence|
      sentence['substantives'].map do |substantive|
        yield substantive
      end
    end
  end

  private

    def phrase_data
      map_sentences do |substantive|
        { word: principal_tokipona_form(substantive['word']), pos: substantive['pos'] }
      end.inject { |sentences, sentence| sentences + sentence }
    end

  	def prepare_analysis
  		self.analysis = Parsing.new(original_text).analysis.to_json
  	end

  	def create_proper_nouns
  		phrase_data.select{ |ph| ph[:pos] == 'pro' }.each do |phrase|
  			TokiponaPhrase.create_proper_noun(phrase[:word])
  		end
  	end

  	def parsed_analysis
  		JSON.parse analysis
  	end
end
