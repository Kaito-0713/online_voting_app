class ChangeElectionIdOnVotes < ActiveRecord::Migration[6.1]
  def change
    change_column_null :votes, :election_id, false
  end
end
