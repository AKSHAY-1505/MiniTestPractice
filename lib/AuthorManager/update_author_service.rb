module AuthorManager
    class UpdateAuthorService
       def initialize(author, author_params)
         @author = author
         @author_params = author_params
       end
   
       def call
         @author.update(@author_params)
       end
    end
   end
   