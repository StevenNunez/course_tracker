class Course < ApplicationRecord
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :ratings

  def rate(user:, rating:)
    ratings.create(user: user, rating: rating)
  end

  def add_tag(tag)
    taggings.create(tag: tag)
  end
end
