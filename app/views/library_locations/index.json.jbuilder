json.array!(@library_locations) do |library_location|
  json.extract! library_location, :id, :city_name, :latitude, :longitude, :user_id
  json.url library_location_url(library_location, format: :json)
end
