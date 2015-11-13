class Dog < ActiveRecord::Base
  belongs_to :user
  has_attached_file :dog_avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/thumb/missing.png"
  validates_attachment_content_type :dog_avatar, :content_type => /\Aimage\/.*\Z/
end
