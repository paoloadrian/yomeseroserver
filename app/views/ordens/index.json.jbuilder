json.array!(@ordens) do |orden|
  json.extract! orden, :id, :mesa, :consumo, :rest, :estado, :nit, :name
  json.url orden_url(orden, format: :json)
end
