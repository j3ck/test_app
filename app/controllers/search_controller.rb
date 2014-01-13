class SearchController < ApplicationController

	def index
		if params[:query].present?
			@searches = Book.search(params[:query])
		else
			@searches = Book.all
		end
	end
end
