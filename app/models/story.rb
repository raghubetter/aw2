class Story < ActiveRecord::Base
  attr_accessible :title, :teaser, :url
  belongs_to :user
  has_many :comments
  validates :title, :presence => true, :length => { :maximum => 140 }
  validates :url, :presence => true, :length => { :maximum => 140 }

  validates :user_id, :presence => true

  def upvote
     self.increment!(:votes)
    end

  def downvote
    self.decrement!(:votes)
  end

end
