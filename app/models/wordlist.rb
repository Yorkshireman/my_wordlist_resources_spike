class Wordlist < ApplicationRecord
  has_many :wordlist_entries
  has_many :words, through: :wordlist_entries
  validates :user_id, presence: true
  validates_format_of :user_id, with: /[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}/
end
