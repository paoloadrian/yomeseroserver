json.array!(@pedido_items) do |pedido_item|
  json.extract! pedido_item, :id, :quantity, :pedido_id, :item_id
  json.url pedido_item_url(pedido_item, format: :json)
end
