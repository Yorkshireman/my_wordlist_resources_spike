class CreateWordlists < ActiveRecord::Migration[5.2]
  def change
    create_table :wordlists do |t|
      t.string :user_id, null: false

      t.timestamps
    end
  end
end
