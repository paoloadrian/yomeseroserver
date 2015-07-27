class Pedido < ActiveRecord::Base
  has_many :pedido_items
end
