class Account < ActiveRecord::Base
	has_many :photos, class_name: 'AccountPhoto', dependent: :destroy
	has_many :videos, dependent: :destroy
	accepts_nested_attributes_for :videos
	accepts_nested_attributes_for :photos
end
