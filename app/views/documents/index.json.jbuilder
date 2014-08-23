json.array!(@documents) do |document|
  json.extract! document, :id, :comment, :file, :version
  json.url document_url(document, format: :json)
end
