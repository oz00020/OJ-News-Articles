class AddPageIdToRanks < ActiveRecord::Migration[5.2]
  def change
    add_column :ranks, :page_id, :integer
  end
end
