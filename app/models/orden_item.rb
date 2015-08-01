class OrdenItem < ActiveRecord::Base
	belongs_to :orden
	belongs_to :item
end
