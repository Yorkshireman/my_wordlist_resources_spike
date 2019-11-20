class Wordlist < ApplicationRecord
  has_many :wordlist_entries
  has_many :words, through: :wordlist_entries
  validates :user_id, presence: true
end
