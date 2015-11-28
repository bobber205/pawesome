class AddAttachmentListingPhotoToListings < ActiveRecord::Migration
  def self.up
    change_table :listings do |t|
      t.attachment :listing_photo
    end
  end

  def self.down
    remove_attachment :listings, :listing_photo
  end
end
