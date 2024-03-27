module AuthorManager
    class CreateAuthorService
       def initialize(author_params)
         @author_params = author_params
       end
   
       def call
         Author.create(@author_params)
       end
    end
   end
   