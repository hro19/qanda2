class Question < ApplicationRecord
  # dependentを付けることによって、親となる質問が削除されたときに、一緒に回答文たちも削除されるような仕組み
  has_many :answers, dependent: :destroy

  validates :title, presence: true
  validates :name, presence: true
  validates :content, presence: true, length: { minimum: 5 }
end