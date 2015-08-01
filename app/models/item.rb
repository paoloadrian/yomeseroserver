class Item < ActiveRecord::Base
  belongs_to :restaurant
  has_many :ordn_items
end
