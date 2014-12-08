json.array!(@users) do |user|
  json.extract! user, :id, :name, :password, :name, :sex, :id, :phone, :email, :type
  json.url user_url(user, format: :json)
end
