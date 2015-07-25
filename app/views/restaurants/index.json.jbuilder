json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :restaurant_name, :restaurant_description, :restaurant_type, :restaurant_address, :restaurant_phone
  json.url restaurant_url(restaurant, format: :json)
end
