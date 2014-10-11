class CreateAccountPhotos < ActiveRecord::Migration
  def change
    create_table :account_photos do |t|
      t.integer :account_id
      t.string :photo
      
      t.timestamps
    end
  end
end
