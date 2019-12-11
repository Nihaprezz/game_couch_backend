class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :mainuser_id
      t.string :content
      t.string :feeling

      t.timestamps
    end
  end
end
