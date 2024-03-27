module BookManager
    class UpdateBookService
       def initialize(book, book_params)
         @book = book
         @book_params = book_params
       end
   
       def call
         @book.update(@book_params)
       end
    end
   end
   