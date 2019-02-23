class Rank < ApplicationRecord

  # Every rank belongs to a page and a user
  belongs_to :page
  belongs_to :user
end
