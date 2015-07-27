class PedidoItem < ActiveRecord::Base
  belongs_to :pedido
  belongs_to :item
end
