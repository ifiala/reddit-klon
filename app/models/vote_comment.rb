class VoteComment<ApplicationRecord



    belongs_to :account
    belongs_to :comment


    validates_uniqueness_of :account_id, scope: :comment_id

    after_create :increment_vote
    after_destroy :decrement_vote


    private

    def increment_vote
        field = self.upvote ? :upvotes : :downvotes
        Comment.find(self.comment_id).increment(field).save
    end

    def decrement_vote
        field = self.upvote ? :upvotes : :downvotes
        Comment.find(self.comment_id).decrement(field).save

    end

end