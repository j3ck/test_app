class CatalogController < ApplicationController

	def index
		@books = Book.paginate(page: params[:page], :per_page => 2)
	end
end
