class AddTitleAndDescriptionToElections < ActiveRecord::Migration[6.1]
  def change
    unless column_exists?(:elections, :title)
      add_column :elections, :title, :string
    end

    unless column_exists?(:elections, :description)
      add_column :elections, :description, :text
    end
  end
end
