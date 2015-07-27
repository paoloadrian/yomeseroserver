class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
  attr_accessor :order_id, :item_id
end
