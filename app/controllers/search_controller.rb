class SearchController < ApplicationController

	def index
		@searches = Book.search(params[:search])
	end
end
