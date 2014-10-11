class Account < ActiveRecord::Base
	has_many :account_photos
	accepts_nested_attributes_for :account_photos
end
