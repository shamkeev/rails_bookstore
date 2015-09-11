class Book < ActiveRecord::Base

  validates :title, presence: true, length: {minimum:1, maximum: 150}
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :description, presence: true, length:{minimum: 10, maximum: 2000}
  validates :author_id, presence: true

  belongs_to :author
  belongs_to :genre
end
