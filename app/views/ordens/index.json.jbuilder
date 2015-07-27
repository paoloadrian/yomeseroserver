json.array!(@ordens) do |orden|
  json.extract! orden, :id, :mesa, :consumo, :rest, :estado
  json.url orden_url(orden, format: :json)
end
