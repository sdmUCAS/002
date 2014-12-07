json.array!(@undone_orders) do |undone_order|
  json.extract! undone_order, :id
  json.url undone_order_url(undone_order, format: :json)
end
