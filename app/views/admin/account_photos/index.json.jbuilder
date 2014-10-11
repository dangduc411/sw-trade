json.array!(@acc_photos) do |acc_photo|
  json.extract! acc_photo, :id, :account_id, :photo, :default
  json.url acc_photo_url(acc_photo, format: :json)
end
