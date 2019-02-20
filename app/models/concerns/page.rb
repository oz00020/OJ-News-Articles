
class Page < ActiveRecord::Base
  has_attached_file :page_image, styles: { page_index: "200x200>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :page_index], content_type: /\Aimage\/.*\z/
end
