module CatalogHelper
	def comments_count(book)
      count = 0
      unless book.comments.empty?
        book.comments.each do |comment|
          if comment.premoderation
            count += 1
          end
        end
      end
    	count
    end
end
