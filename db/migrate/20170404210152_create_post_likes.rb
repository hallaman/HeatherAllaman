class CreatePostLikes < ActiveRecord::Migration
  def change
    create_table :post_likes do |t|
      t.string :postable_id
      t.integer :count

      t.timestamps null: false
    end
  end
end
