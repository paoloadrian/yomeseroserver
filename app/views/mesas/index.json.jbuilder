json.array!(@mesas) do |mesa|
  json.extract! mesa, :id, :numero, :estado, :restaurant_id
  json.url mesa_url(mesa, format: :json)
end
