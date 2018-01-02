class Post < ApplicationRecord
  belongs_to :user
  acts_as_votable
  has_many :comments
  validates :body, presence: true
end
