class PagesController < ApplicationController
	def home
		if params[:tag]
			@accounts = Account.tagged_with(params[:tag])
		else
			@accounts = Account.all
		end
	end

	def detail
		@account = Account.find(params[:id])
	end

	def confirm
		
	end
end