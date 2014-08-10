json.array!(@companies) do |company|
  json.extract! company, :id, :name, :symbol, :website, :contact, :order_email
  json.url company_url(company, format: :json)
end
