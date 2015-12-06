json.array!(@rooms) do |room|
  json.extract! room, :id, :price, :deposit, :internet, :furnished, :smoking, :gender, :closest_station, :zone, :description
  json.url room_url(room, format: :json)
end
