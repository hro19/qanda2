class Answer < ApplicationRecord
  belongs_to :question

# 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @answers = Answer.where("content LIKE?", "#{word}")
    elsif search == "forward_match"
      @answers = Answer.where("content LIKE?","#{word}%")
    elsif search == "backward_match"
      @answers = Answer.where("content LIKE?","%#{word}")
    elsif search == "partial_match"
      @answers = Answer.where("content LIKE?","%#{word}%")
    else
      @answers = Answer.all
    end
  end

end
