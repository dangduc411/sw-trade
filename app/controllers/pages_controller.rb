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
	
	def search
		tagging = Tags.find_by! name: params[:search]
		@accs = Taggings.where(tag_id: tagging)
	end
end