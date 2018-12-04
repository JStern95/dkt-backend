class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.boolean :hasPassword
      t.string :unSecurePassword, :default => ""
      t.boolean :active, :default => false
      t.integer :current_players, :default => 0

      t.timestamps
    end
  end
end
