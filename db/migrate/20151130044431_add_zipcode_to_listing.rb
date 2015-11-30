class AddZipcodeToListing < ActiveRecord::Migration
  def change
    add_column :listings, :zipcode, :integer
  end
end
