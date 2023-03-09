class NotesController < ApplicationController
  before_action :set_note, only: [:show]

  def index
    order_column = params[:sort] || 'created_at'
    order_direction = params[:direction] || :desc

    @notes = Note.order("#{order_column} #{order_direction}")                       .paginate(page: params[:page], per_page: 9)

    @directions = [
      { column: 'title', direction: :asc },
      { column: 'title', direction: :desc },
      { column: 'date', direction: :asc },
      { column: 'date', direction: :desc }
    ]
  end

  def show
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

  def set_note
    @note = Note.find(params[:id])
  end
end
