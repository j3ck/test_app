class SearchController < ApplicationController

	def index
		if params[:query].present?
			@searches = Book.search(params)
		else
			@searches = Book.paginate(page: params[:page], :per_page => 10)
		end
	end
end
