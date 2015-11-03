class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :breed
      t.string :size
      t.text :describtion
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
