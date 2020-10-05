class Account < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :subscriptions
  has_many :posts
  has_many :communities, through: :subscriptions
  has_many :comments
  has_many :votes
  
  validates_presence_of  :username

  def upvoted_post_ids
   self.votes.where(upvote: true).pluck(:post_id)

  end

  def downvoted_post_ids
    self.votes.where(upvote: false).pluck(:post_id)
  end


end