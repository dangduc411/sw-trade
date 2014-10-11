class PagesController < ApplicationController
	def home
		@accounts = Account.all
	end

	def detail
		@account = Account.find(params[:id])
	end

	def confirm
		
	end
end