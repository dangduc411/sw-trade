6.times do |num|
	Account.create!(
		lv: num,
		price: 100,
		description: "none",
		user: "qwe",
		pass: "qwe"
	).tap do |account|
		account.photos.create!(photo: File.new(Rails.root.join("app", "assets", "images", "acc1.PNG")))
		account.photos.create!(photo: File.new(Rails.root.join("app", "assets", "images", "acc2.PNG")))
		account.videos.create!(video: "TGtWWb9emYI")
		end
	puts "created acc #{num}"
end
