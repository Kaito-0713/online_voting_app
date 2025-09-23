class CreateCandidates < ActiveRecord::Migration[6.1]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :party
      t.references :election, null: false, foreign_key: true

      t.timestamps
    end
  end
end
