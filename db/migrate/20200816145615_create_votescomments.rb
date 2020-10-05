class CreateVotescomments < ActiveRecord::Migration[6.0]
  def change
    create_table :votescomments do |t|
      t.references :account
      t.references :comment
      t.boolean :upvote
      t.timestamps
    end
  end
end
