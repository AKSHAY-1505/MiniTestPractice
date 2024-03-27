module BookManager
    class CreateBookService

      attr_reader :errors
       def initialize(params, book_class: Book)
         @params = params
         @book_class = book_class
       end
   
       def call
         book = @book_class.new(@params)
         @errors = book.errors unless book.errors.blank?
         self
       end

       def test_db
        false
       end
    end
   end
   