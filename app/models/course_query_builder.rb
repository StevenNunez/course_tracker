class CourseQueryBuilder
  def run(params)
    params.reduce(Course) do |query, (facet, constraint)|
      case facet
      when :tags
        filter_tags(query, constraint)
      when :rating
        filter_minimum_rating(query, constraint)
      else
        query
      end
    end
  end

  def filter_tags(query, tags)
    Course.where(id: query.all).joins(:tags).where(tags: {name: tags}).group("id").having("COUNT(*) = ?", tags.count)
  end

  def filter_minimum_rating(query, rating)
    Course.where(id: query.all).joins(:ratings).group(:id).having("avg(ratings.rating) > ?", rating)
  end
end
