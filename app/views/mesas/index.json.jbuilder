json.array!(@mesas) do |mesa|
  json.extract! mesa, :id, :number, :state, :restaurant_id
  json.url mesa_url(mesa, format: :json)
end
