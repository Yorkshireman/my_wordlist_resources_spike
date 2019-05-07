class WordlistEntry < ApplicationRecord
  validates :word_id, presence: true
  validates :wordlist_id, presence: true
  belongs_to :word
  belongs_to :wordlist
  has_many :wordlist_entry_categories
  has_many :categories, through: :wordlist_entry_categories, source: :category
end
