class CreateLikedGames < ActiveRecord::Migration[6.0]
  def change
    create_table :liked_games do |t|
      t.integer :mainuser_id
      t.integer :game_id

      t.timestamps
    end
  end
end
