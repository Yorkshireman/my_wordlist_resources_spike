class AddDescriptionToWordlistEntry < ActiveRecord::Migration[5.2]
  def change
    add_column :wordlist_entries, :description, :string
  end
end
