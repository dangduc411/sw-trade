class AccountPhoto < ActiveRecord::Base
	mount_uploader :photo, ::PhotoUploader
	belongs_to :account

	scope :default, -> {where(default:true)}
end
