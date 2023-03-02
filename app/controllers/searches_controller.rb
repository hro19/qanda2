class SearchesController < ApplicationController

  def search
    @range = params[:range]

    if @range == "Question"
      @questions = Question.looks(params[:search], params[:word])
      render "/searches/search_result"
    else
      @answers = Answer.looks(params[:search], params[:word])
      render "/searches/search_result"
    end
  end
end