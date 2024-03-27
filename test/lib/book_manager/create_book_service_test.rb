require 'test_helper'
require 'minitest/mock'

class CreateBookServiceTest < Minitest::Test
 def setup
    @book_manager =BookManager::CreateBookService
 end

#  def test_initialize
#     assert_instance_of BookManager::CreateBookService, @service
#  end

 def test_call_creates_book
   params = { title: 'Test Book', author_id: 1 }
   book_manager = @book_manager.new(params, book_class: book_class_mock).call
   puts book_manager.errors
   assert ['1'], book_manager.errors
 end

   def book_class_mock
      mock =  Minitest::Mock.new
      mock.expect(:new, mock, [{ title: 'Test Book', author_id: 1 }])
      2.times { mock.expect(:errors, ['1']) }
      mock
   end
end
