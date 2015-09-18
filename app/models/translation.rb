class Translation < ActiveRecord::Base
	require 'json'
	include GrammarHelper
	include EachHead

  belongs_to :user
  belongs_to :document
  has_many :pairings, class_name: 'PhrasePairing', dependent: :destroy

  validates :user, presence: true

  def english_phrases
  	@english_phrases ||= EnglishPhrase.all_in document.phrases
  end
end
