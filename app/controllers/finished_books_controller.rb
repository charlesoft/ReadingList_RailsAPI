class FinishedBooksController < ApplicationController
  def index
    books = Book.where('finished_at IS NOT NULL')
    respond_to do |format|
      format.json { render json: books, status: 200 }
      format.xml { render xml: books, status: 200 }
    end
  end
end
