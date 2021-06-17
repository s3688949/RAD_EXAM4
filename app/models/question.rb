class Question < ApplicationRecord
  belongs_to :database
  has_many :answers
end
