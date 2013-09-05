json.array!(@operations) do |operation|
  json.extract! operation, 
  json.url operation_url(operation, format: :json)
end
