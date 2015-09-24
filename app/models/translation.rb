class Translation < ActiveRecord::Base
	require 'json'
	include GrammarHelper

  belongs_to :user
  belongs_to :document
  has_many :pairings, class_name: 'PhrasePairing', dependent: :destroy

  validates :user, presence: true
  # TODO: validate JSON array format for analysis

  after_create :create_phrase_pairings
  after_update :update_phrase_pairings

  def english_phrases
  	@english_phrases ||= document.english_phrases
  end

	def create_phrase_pairings
	end

	def update_phrase_pairings
	end  
end
