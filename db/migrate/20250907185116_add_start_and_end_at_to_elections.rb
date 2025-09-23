class AddStartAndEndAtToElections < ActiveRecord::Migration[6.1]
  def change
    add_column :elections, :start_at, :datetime
    add_column :elections, :end_at, :datetime
  end
end
