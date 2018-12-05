class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'citext'
    create_table :users do |t|
      t.citext :username
      t.string :password_digest
      t.integer :games_won, :default => 0
      t.integer :games_lost, :default => 0
      t.integer :games_played, :default => 0

      t.timestamps
    end
  end
end
