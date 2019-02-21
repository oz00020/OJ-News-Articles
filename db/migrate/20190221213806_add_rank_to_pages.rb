class AddRankToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :rank, :integer
  end
end
