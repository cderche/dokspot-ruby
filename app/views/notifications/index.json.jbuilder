json.array!(@notifications) do |notification|
  json.extract! notification, :id, :content, :category, :product_id, :expiration, :published
  json.url notification_url(notification, format: :json)
end
