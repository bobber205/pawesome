class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  validates :address, :zipcode, :title, :describtion, :property_type, :dog_type, presence: true
  geocoded_by :address    
  after_validation :geocode          # auto-fetch coordinates
  
  def self.search(search)
  where("zipcode LIKE ?", "%#{search}%")    
  end

end
