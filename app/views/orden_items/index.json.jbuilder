json.array!(@orden_items) do |orden_item|
  json.extract! orden_item, :id, :cantidad, :id_item, :id_ordem
  json.url orden_item_url(orden_item, format: :json)
end
