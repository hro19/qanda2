class SearchesController < ApplicationController
  def search
    @range = params[:range]

    if @range == 'Question'
      @questions = Question.looks(params[:search], params[:word])
    else
      @answers = Answer.looks(params[:search], params[:word])
    end

    render '/searches/search_result'
  end
end
