module AuthorManager
    class DeleteAuthorService
       def initialize(author)
         @author = author
       end
   
       def call
         @author.destroy
       end
    end
   end
   