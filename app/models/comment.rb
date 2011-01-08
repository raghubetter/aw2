class Comment < ActiveRecord::Base
  belongs_to :story
  belongs_to :user
  attr_accessible :comment_text

  validates :comment_text, :presence => true, :length => { :maximum => 140 }
#  validates :user_id, :presence => true
    validates :story_id, :presence => true
end
