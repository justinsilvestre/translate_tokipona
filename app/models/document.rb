class Document < ActiveRecord::Base
  belongs_to :user
  has_many :translations, dependent: :destroy

  validates :title, presence: true
  validates :original_text, presence: true
end
