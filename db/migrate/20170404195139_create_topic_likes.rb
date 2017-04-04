class CreateTopicLikes < ActiveRecord::Migration
  def change
    create_table :topic_likes do |t|
      t.string :hash_id
      t.integer :count

      t.timestamps null: false
    end
  end
end
