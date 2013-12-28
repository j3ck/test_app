module BooksHelper
	def other_books_current_author(author,id)
		oth = Array.new 
		@books = Book.all
		@books.each do |book|
			if (book.author == author) && (book.id != id)
				oth.push(book)
			end
		end
		oth
	end
end
