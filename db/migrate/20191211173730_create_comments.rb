class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :mainuser_id
      t.integer :game_id
      t.string :content

      t.timestamps
    end
  end
end
