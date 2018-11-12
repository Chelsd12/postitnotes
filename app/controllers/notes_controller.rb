class NotesController < ApplicationController
  def index
      @notes = Note.all
  end

  def show
    @notes = Note.find(params[:id])
  end

  def edit
    @notes = Note.find(params[:id])
  end

  def new
    @notes = Note.new
  end

  def create
    @note = Note.new(pages_params)

    if(@note.save)
      redirect_to pages_path
    else
      render :new
    end
  end

  def update
    @note = Note.find(params[:id]) 
    if @note.update(page_params)
      redirect_to pages_path
    else
      render :edit
    end
  end
  
  private
  def page_params
    params.require(:note).permit(:title, :author, :body)
  end
end
