class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :game_api_id
      t.string :picture
      t.string :name

      t.timestamps
    end
  end
end
