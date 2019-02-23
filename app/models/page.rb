
class Page < ActiveRecord::Base

# A page has many ranks and if a page is deleted then all the associated ranks are deleted too
  has_many :ranks, dependent: :destroy

# A page can have it's own image attached with width and height 200px. If there is no image attached then a default image will be displayed instead. The page image is stored under the varibale page_image
  has_attached_file :page_image, styles: { page_show: "200x200>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :page_image, content_type: /\Aimage\/.*\z/
end
