class Comment < ActiveRecord::Base
  belongs_to :story
  belongs_to :user
  attr_accessible :comment_text

  APPROVED = 1
  REJECTED = 2
  DEFAULT = 0

  validates :comment_text, :presence => true, :length => { :maximum => 140 }
  #  validates :user_id, :presence => true
  validates :story_id, :presence => true

  scope :moderated, lambda {|num|
    where("comments.moderated = 1 AND comments.story_id = ?", num)
  }


  def upvote
    self.increment!(:votes)
  end

  def downvote
    self.decrement!(:votes)
  end

  def approved
    self.update_attribute(:moderated, Comment::APPROVED)
  end

  def rejected
    self.update_attribute(:moderated, Comment::REJECTED)
  end
end
