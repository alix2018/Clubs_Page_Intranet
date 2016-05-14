json.array!(@events) do |event|
  json.extract! event, :id, :title, :text, :date_start, :date_end, :is_private, :user_id
  json.url event_url(event, format: :json)
end
