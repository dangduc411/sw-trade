class AccountPhoto < ActiveRecord::Base
	mount_uploader :photo, ::PhotoUploader
	belongs_to :account
end
