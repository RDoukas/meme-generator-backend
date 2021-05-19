class CreateMemes < ActiveRecord::Migration[6.1]
  def change
    create_table :memes do |t|
      t.string :top_text
      t.string :bottom_text
      t.string :random_img
      t.integer :user_id

      t.timestamps
    end
  end
end
