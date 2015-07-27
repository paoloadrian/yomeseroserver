json.array!(@tables) do |table|
  json.extract! table, :id, :number, :state, :restaurant_id
  json.url table_url(table, format: :json)
end
