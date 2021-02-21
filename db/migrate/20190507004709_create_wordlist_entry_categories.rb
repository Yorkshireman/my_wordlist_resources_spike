class CreateWordlistEntryCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :wordlist_entry_categories do |t|
      t.belongs_to :category, index: true
      t.belongs_to :wordlist_entry, index: true

      t.timestamps
    end
  end
end
