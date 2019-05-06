class CreateWordlistEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :wordlist_entries do |t|
      t.belongs_to :word, index: true
      t.belongs_to :wordlist, index: true

      t.timestamps
    end
  end
end
