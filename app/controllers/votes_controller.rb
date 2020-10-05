class VotesController < ApplicationController

    def create
        
        post_id = params[:post_id]
        vote=Vote.new
        vote.post_id = params[:post_id]
        vote.upvote = params[:upvote]
        vote.account_id = current_account.id 
        #Existing vote check
        existing_vote = Vote.where(account_id: current_account.id, post_id: post_id)
        @new_vote = existing_vote.size<1
        respond_to do |format|
          format.js{
            if existing_vote.size > 0
                existing_vote.first.destroy 
            else  
                if vote.save 
                    @success=true 
                else
                    @success = false
                end
                
                
            end    
            @post = Post.find(post_id)
            @is_upvote = params[:upvote]
            render "votes/create"
          }
        end
    end
    

    # comment_id = params[:comment_id]
    #     vote=Vote.new#(vote_params)
    #     vote.comment_id = params[:comment_id]
    #     vote.upvote = params[:upvote]
    #     vote.account_id = current_account.id 
    #     #Existing vote check
    #     existing_vote_comment = Vote.where(account_id: current_account.id, comment_id: comment_id)
    #     @new_vote_comment = existing_vote.size<1
    #     respond_to do |format|
    #       format.js{
    #         if existing_vote_comment.size > 0
    #             existing_vote_comment.first.destroy 
    #         else  
    #             if vote.save 
    #                 @success=true 
    #             else
    #                 @success = false
    #             end
                
                
    #         end    
    #         @comment = Comment.find(comment_id)
    #         @is_upvote_comment = params[:upvote]
    #         render "votes/create"
    #       }
    #     end
    # end
    private
    def vote_params
        params.require(:vote).permit(:upvote, :post_id)
     #   params.require(:vote).permit(:upvote, :comment_id)
    end
end
