json.array!(@accounts) do |account|
  json.extract! account, :id, :lv, :price, :description, :selled, :user, :pass
  json.url account_url(account, format: :json)
end
