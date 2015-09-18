class EnglishPhrase < ActiveRecord::Base
  belongs_to :user
  belongs_to :tokipona_phrase

  def self.from_tokipona(tp_id)
    EnglishPhrase.where(tokipona_phrase_id: tp_id)
  end

  def self.all_in(tokipona_phrases)
  	self.from_tokipona tokipona_phrases.map(&:id)
  end
end
