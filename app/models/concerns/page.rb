
class Page < ActiveRecord::Base

  belongs_to :user
  has_many :ranks, dependent: :destroy

  has_attached_file :page_image, styles: { page_index: "200x200>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :page_image, content_type: /\Aimage\/.*\z/
end
