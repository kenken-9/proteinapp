class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null:  false
      t.string :taste, null:  false
      t.integer :price, null:  false
      t.integer :protein, null:  false
      t.integer :lipid, null:  false
      t.integer :amount, null:  false
      t.text :impression, null:  false
      t.references :user ,null:false, foreign_key: true 
      t.timestamps
    end
  end
end
