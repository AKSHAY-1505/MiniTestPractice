class AuthorsController < ApplicationController
  before_action :set_author, only: %i[ show edit update destroy ]

  # GET /authors or /authors.json
  def index
    @authors = Author.all
  end

  # GET /authors/1 or /authors/1.json
  def show
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
  end

  # POST /authors or /authors.json
  def create
    service = AuthorManager::CreateAuthorService.new(author_params)
    @author = service.call

    if @author.persisted?
      redirect_to @author, notice: 'Author was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /authors/1 or /authors/1.json
  def update
    service = AuthorManager::UpdateAuthorService.new(@author, author_params)
    if service.call
      redirect_to @author, notice: 'Author was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /authors/1 or /authors/1.json
  def destroy
    service = AuthorManager::DeleteAuthorService.new(@author)
    service.call
    redirect_to authors_url, notice: 'Author was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def author_params
      params.require(:author).permit(:name)
    end
end
