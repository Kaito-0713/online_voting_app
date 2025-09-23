class AddPolicyToCandidates < ActiveRecord::Migration[6.1]
  def change
    add_column :candidates, :policy, :text
  end
end
