json.array!(@books) do |book|
  json.extract! book, :id, :title, :description, :author
  json.url book_url(book, format: :json)
end
