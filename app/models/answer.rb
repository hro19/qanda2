# This class represents an answer to a question.
#
# It provides a method to perform different types of searches on the answer content.
#
# @param [String] search The type of search to perform.
# @param [String] word The word to search for.
# @return [ActiveRecord::Relation] The collection of answers that match the search criteria.
class Answer < ApplicationRecord
  belongs_to :question

  # 検索方法分岐
  def self.looks(search, word)
    @answers = case search
               when 'perfect_match'
                 Answer.where('content LIKE ?', word.to_s)
               when 'forward_match'
                 Answer.where('content LIKE ?', "#{word}%")
               when 'backward_match'
                 Answer.where('content LIKE ?', "%#{word}")
               when 'partial_match'
                 Answer.where('content LIKE ?', "%#{word}%")
               else
                 Answer.all
               end
  end
end
