class Expenditure < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, styles: { small: "64x64", med: "200x200", large: "400x400" }, :default_url => "/images/:style/missing.png"
	validates :item, :price, :presence => true
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
