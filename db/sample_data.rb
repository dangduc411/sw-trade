5.times do |num|
	Account.create!(
		lv: num,
		price: 100,
		description: "none",
		user: "qwe",
		pass: "qwe",
		tag_list: 'abc, def' 
	).tap do |account|
		account.photos.create!(photo: File.new(Rails.root.join("app", "assets", "images", "acc1.PNG")))
		account.photos.create!(photo: File.new(Rails.root.join("app", "assets", "images", "acc2.PNG")))
		account.videos.create!(video: "7-7knsP2n5w")
		account.videos.create!(video: "TGtWWb9emYI")
		end
	puts "created acc #{num}"
end
5.times do |num|
	Account.create!(
		lv: num,
		price: 100,
		description: "none",
		user: "qwe",
		pass: "qwe",
		tag_list: 'ghi, jkl' 
	).tap do |account|
		account.photos.create!(photo: File.new(Rails.root.join("app", "assets", "images", "acc1.PNG")))
		account.photos.create!(photo: File.new(Rails.root.join("app", "assets", "images", "acc2.PNG")))
		account.videos.create!(video: "7-7knsP2n5w")
		account.videos.create!(video: "TGtWWb9emYI")
		end
	puts "created acc #{num}"
end
User.create(email: "admin@hte.vn", password: "123", password_confirmation: "123")