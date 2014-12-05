json.array!(@uncheck_orders) do |uncheck_order|
  json.extract! uncheck_order, :id
  json.url uncheck_order_url(uncheck_order, format: :json)
end
