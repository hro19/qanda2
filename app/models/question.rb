class Question < ApplicationRecord
  # dependentを付けることによって、親となる質問が削除されたときに、一緒に回答文たちも削除されるような仕組み
  has_many :answers, dependent: :destroy

  validates :title, presence: true
  validates :name, presence: true
  validates :content, presence: true, length: { minimum: 5 }

  # 検索方法分岐
  def self.looks(search, word)
    @questions = if search == 'perfect_match'
                   Question.where('content LIKE?', "#{word}")
                 elsif search == 'forward_match'
                   Question.where('content LIKE?', "#{word}%")
                 elsif search == 'backward_match'
                   Question.where('content LIKE?', "%#{word}")
                 elsif search == 'partial_match'
                   Question.where('content LIKE?', "%#{word}%")
                 else
                   Question.all
                 end
  end
end
