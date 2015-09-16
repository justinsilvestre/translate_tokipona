class EnglishPhrase < ActiveRecord::Base
  belongs_to :user
  belongs_to :tokipona_phrase
end
