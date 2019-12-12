# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
Course.where(id:
               Course.joins(:ratings).group(:id).having("avg(ratings.rating) > 2")
).joins(:tags).where(tags: {name: tags}).group("id").having("COUNT(*) = ?", tags.count)
steven = User.create(name: "Steven")
marven = User.create(name: "Marven")
yelimar = User.create(name: "Yelimar")

good_course = Course.create(name: "Cooking")
meh_course = Course.create(name: "Learn to Code")
bad_course = Course.create(name: "Dark Arts")

food = Tag.create(name: "Food")
fun = Tag.create(name: "Fun")
magic = Tag.create(name: "Magic")
code = Tag.create(name: "Code")

good_course.add_tag(food)
good_course.add_tag(fun)

meh_course.add_tag(fun)
meh_course.add_tag(magic)
meh_course.add_tag(code)

bad_course.add_tag(magic)

good_course.rate(user: steven, rating: 5)
good_course.rate(user: marven, rating: 5)
good_course.rate(user: yelimar, rating: 5)

meh_course.rate(user: steven, rating: 3)
meh_course.rate(user: marven, rating: 3)
meh_course.rate(user: yelimar, rating: 3)

bad_course.rate(user: steven, rating: 1)
bad_course.rate(user: marven, rating: 1)
bad_course.rate(user: yelimar, rating: 1)


