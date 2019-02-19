class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.integer :pageid, null:false, unique:true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
