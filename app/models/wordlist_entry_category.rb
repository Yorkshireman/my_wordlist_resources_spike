class WordlistEntryCategory < ApplicationRecord
  belongs_to :category
  belongs_to :wordlist_entry
  has_many :categories, through: :wordlist_entries
end
