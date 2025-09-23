class AddElectionIdToVotes < ActiveRecord::Migration[6.1]
  def change
    add_reference :votes, :election, null: false, foreign_key: true, null: true
  end
end
