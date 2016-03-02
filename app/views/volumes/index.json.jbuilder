json.array!(@volumes) do |volume|
  json.extract! volume, :id, :title, :author, :page_count, :published_date, :user_id
  json.url volume_url(volume, format: :json)
end
