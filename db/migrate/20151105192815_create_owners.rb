class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile_phone
      t.attachment :avatar
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
