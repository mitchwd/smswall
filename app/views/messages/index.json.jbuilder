json.array!(@messages) do |message|
  json.extract! message, :content, :author, :kind, :url, :visible, :message_timestamp
  json.url message_url(message, format: :json)
end
