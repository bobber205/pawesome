class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.attachment :image
      t.integer :listing_id

      t.timestamps null: false
    end
  end
end
