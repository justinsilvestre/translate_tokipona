class Document < ActiveRecord::Base
	require 'tokipona'
	require 'json'
	include EachHead
	include GrammarHelper

  belongs_to :user
  has_many :translations, dependent: :destroy

  validates :title, presence: true
  validates :original_text, presence: true

  before_save :prepare_analysis, :create_proper_nouns

  def phrases
   TokiponaPhrase.all_in phrase_data
  end

  private

	  def phrase_data
	  	@phrase_data ||= []
	  	each_head(parsed_analysis) do |head, parent_phrase|
	  		@phrase_data << { words: head, role: head_role(parent_phrase) }
	  	end
	  	@phrase_data
	  end

  	def prepare_analysis
  		self.analysis = Parsing.new(original_text).json
  	end

  	def create_proper_nouns
  		phrase_data.select{ |ph| ph[:role] == 'pro' }.each do |phrase|
  			TokiponaPhrase.create_proper_noun(phrase[:words])
  		end
  	end

  	def parsed_analysis
  		JSON.parse analysis
  	end
end
