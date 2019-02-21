class AddRankRatingToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :rank_rating, :integer
  end
end
