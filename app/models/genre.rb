class Genre < ActiveRecord::Base

  validates :title, presence: true, length: {minimum:5, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 500}


  has_many :books
end
