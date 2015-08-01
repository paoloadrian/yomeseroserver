class Item < ActiveRecord::Base
  belongs_to :restaurant
  has_many :orden_items
end
