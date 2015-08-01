class Orden < ActiveRecord::Base
	has_many :orden_items
end
