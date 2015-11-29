class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :address
      t.string :title
      t.text :describtion
      t.string :property_type
      t.string :dog_type
      t.integer :user_id
       

      t.timestamps null: false
    end
  end
end
