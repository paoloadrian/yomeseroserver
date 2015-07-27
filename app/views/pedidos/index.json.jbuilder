json.array!(@pedidos) do |pedido|
  json.extract! pedido, :id, :consumo, :restaurant_id, :estado, :mesa
  json.url pedido_url(pedido, format: :json)
end
