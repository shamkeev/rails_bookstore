class Author < ActiveRecord::Base

  validates :name, presence: true, length: {minimum:5, maximum: 150}
  validates :bio, presence: true, length: {minimum: 20, maximum: 2000}

  has_many :books
end
