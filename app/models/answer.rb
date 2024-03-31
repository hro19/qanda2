class Answer < ApplicationRecord
  belongs_to :question

  # 検索方法分岐
  def self.looks(search, word)
    @answers = if search == 'perfect_match'
                 Answer.where('content LIKE?', "#{word}")
               elsif search == 'forward_match'
                 Answer.where('content LIKE?', "#{word}%")
               elsif search == 'backward_match'
                 Answer.where('content LIKE?', "%#{word}")
               elsif search == 'partial_match'
                 Answer.where('content LIKE?', "%#{word}%")
               else
                 Answer.all
               end
  end
end
