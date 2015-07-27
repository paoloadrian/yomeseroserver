class Table < ActiveRecord::Base
  belongs_to :restaurant
  attr_accessor :restaurant_id
end
