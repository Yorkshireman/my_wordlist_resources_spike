class Category < ApplicationRecord
  before_save { self.name.downcase! }
  has_many :wordlist_entry_categories
  has_many :wordlist_entries, through: :wordlist_entry_categories
  validates :name, presence: true
end
