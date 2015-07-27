class Order < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user
  has_many :order_items
  belongs_to :tableç
end
