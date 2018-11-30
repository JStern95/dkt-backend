class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.boolean :hasPassword
      t.string :unSecurePassword, :default => ""
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
