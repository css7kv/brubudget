class Expenditure < ActiveRecord::Base
	has_attached_file :image, styles: { small: "64x64", med: "200x200", large: "400x400" }
	validates :item, :price, :presence => true
	validates_attachment :image, :content_type => { :content_type => "image/jpg" }
end
