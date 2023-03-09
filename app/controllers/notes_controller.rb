class NotesController < ApplicationController
  def index
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to root_path, flash: { success: ['Note was created.'] }
    else
      render :new, flash: { danger: @note.errors.full_messages }
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :body, :date)
  end
end
