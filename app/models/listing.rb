class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  validates :address, :title, :describtion, :property_type, :dog_type, presence: true

end
