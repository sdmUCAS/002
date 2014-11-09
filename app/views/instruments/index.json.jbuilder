json.array!(@instruments) do |instrument|
  json.extract! instrument, :id, :name, :type_name, :image_url, :description, :price
  json.url instrument_url(instrument, format: :json)
end
