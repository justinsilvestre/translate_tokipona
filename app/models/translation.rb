class Translation < ActiveRecord::Base
  belongs_to :user
  belongs_to :document
  has_many :pairings, class_name: 'PhrasePairing', dependent: :destroy
end
