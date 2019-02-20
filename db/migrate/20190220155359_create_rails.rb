class CreateRails < ActiveRecord::Migration[5.2]
  def change
    create_table :rails do |t|
      t.string :generate
      t.string :model
      t.string :Rank
      t.integer :rating

      t.timestamps
    end
  end
end
  
