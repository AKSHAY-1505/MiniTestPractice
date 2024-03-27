module BookManager
    class DeleteBookService
       def initialize(book)
         @book = book
       end
   
       def call
         @book.destroy
       end
    end
   end
   