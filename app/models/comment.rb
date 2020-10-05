class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :account
    validates_presence_of :message, :account_id, :post_id
    
    def score
        if self.upvotes > 0 || self.downvotes > 0
            self.upvotes> 0 ? (self.upvotes - self.downvotes) : (self.downvotes * -1)
        else
            0
        end
    end
end