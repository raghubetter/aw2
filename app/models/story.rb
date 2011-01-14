class Story < ActiveRecord::Base
  attr_accessible :title, :teaser, :url
  belongs_to :user
  has_many :comments
  validates :title, :presence => true, :length => { :maximum => 140 }
  validates :url, :presence => true, :length => { :maximum => 140 }

  validates :user_id, :presence => true

  def upvote(story_id)
      story = Story.where(:story_id => story_id)
      #story.votes += 1
      story.increment(:votes)
  end

  def downvote(story_id)
      story = Story.where(:story_id => story_id)
      story.decrement(:votes)
  end

end
