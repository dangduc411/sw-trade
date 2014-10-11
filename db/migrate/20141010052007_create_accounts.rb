class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :lv
      t.decimal :price, precision: 8, scale: 2 
      t.text :description
      t.string :video
      t.boolean :selled, default: false
      t.string :user
      t.string :pass

      t.timestamps
    end
  end
end
