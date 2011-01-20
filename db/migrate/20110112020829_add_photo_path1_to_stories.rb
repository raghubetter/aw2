class AddPhotoPath1ToStories < ActiveRecord::Migration
  def self.up
    add_column :stories, :photo_path1, :string
  end

  def self.down
    remove_column :stories, :photo_path1
  end
end
