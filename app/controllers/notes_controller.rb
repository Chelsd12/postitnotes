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
    @note = Note.new(notes_params)

    if(@note.save)
      redirect_to notes_path
    else
      render :new
    end
  end

  def update
    @note = Note.find(params[:id]) 
    if @note.update(note_params)
      redirect_to notes_path
    else
      render :edit
    end
  end
  
  private
  def note_params
    params.require(:note).permit(:title, :author, :body)
  end
end
