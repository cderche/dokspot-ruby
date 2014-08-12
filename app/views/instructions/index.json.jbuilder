json.array!(@instructions) do |instruction|
  json.extract! instruction, :id, :product_id, :language_id
  json.url instruction_url(instruction, format: :json)
end
