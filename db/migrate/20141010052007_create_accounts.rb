class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :lv
      t.decimal :price, precision: 8, scale: 2 
      t.text :description
      t.boolean :selled, default: false
      t.string :user
      t.string :pass
      t.string :payer_id
      t.string :payer_ip  
      t.string :payer_email

      t.timestamps
    end
  end
end
