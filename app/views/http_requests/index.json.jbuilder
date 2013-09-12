json.array!(@http_requests) do |http_request|
  json.extract! http_request, :method, :parameters, :ip_address
  json.url http_request_url(http_request, format: :json)
end
