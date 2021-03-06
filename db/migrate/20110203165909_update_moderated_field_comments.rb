class UpdateModeratedFieldComments < ActiveRecord::Migration
  def self.up
    remove_column :comments, :moderated
    add_column :comments, :moderated, :integer, :default => 0
  end

  def self.down
    remove_column :comments, :moderated
    add_column :comments, :moderated, :boolean
  end
end
