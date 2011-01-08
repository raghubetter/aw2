class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :comment_text
      t.integer :story_id
      t.integer :user_id, :default  => 101
      t.boolean :moderated

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
