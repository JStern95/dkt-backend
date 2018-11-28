class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.boolean :hasPassword
      t.string :unSecurePassword
      t.boolean :active

      t.timestamps
    end
  end
end
