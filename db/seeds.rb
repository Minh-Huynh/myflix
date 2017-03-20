# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
case Rails.env
when "development"
  action = Category.create(title: "Action")
  scifi = Category.create(title: "Scifi")

  User.create(full_name: "Minh Huynh", email: "minhh1990@gmail.com", password: "watermelon")
  Video.create(title: "Monk", description: "Weird investigator", small_cover_url: "/tmp/monk.jpg", large_cover_url: "/tmp/monk_large.jpg", category: action)
  Video.create(title: "Family Guy", description: "Weird family", small_cover_url: "/tmp/family_guy.jpg", large_cover_url: "/tmp/family_guy.jpg", category: action)
  Video.create(title: "Monk", description: "Weird investigator", small_cover_url: "/tmp/monk.jpg", large_cover_url: "/tmp/monk_large.jpg", category: scifi)
  Video.create(title: "Family Guy", description: "Weird family", small_cover_url: "/tmp/family_guy.jpg", large_cover_url: "/tmp/family_guy.jpg", category: scifi)
  Video.create(title: "Monk", description: "Weird investigator", small_cover_url: "/tmp/monk.jpg", large_cover_url: "/tmp/monk_large.jpg", category: action)
  Video.create(title: "Family Guy", description: "Weird family", small_cover_url: "/tmp/family_guy.jpg", large_cover_url: "/tmp/family_guy.jpg", category: action)
  Video.create(title: "Monk", description: "Weird investigator", small_cover_url: "/tmp/monk.jpg", large_cover_url: "/tmp/monk_large.jpg",category: action)
  Video.create(title: "Family Guy", description: "Weird family", small_cover_url: "/tmp/family_guy.jpg", large_cover_url: "/tmp/family_guy.jpg", category: action)
  Video.create(title: "Monk", description: "Weird investigator", small_cover_url: "/tmp/monk.jpg", large_cover_url: "/tmp/monk_large.jpg", category: scifi )
  Video.create(title: "Family Guy", description: "Weird family", small_cover_url: "/tmp/family_guy.jpg", large_cover_url: "/tmp/family_guy.jpg", category: scifi)
  Video.create(title: "Monk", description: "Weird investigator", small_cover_url: "/tmp/monk.jpg", large_cover_url: "/tmp/monk_large.jpg", category: scifi)
  Video.create(title: "Futurama", description: "funny scifi", small_cover_url: "/tmp/futurama.jpg", large_cover_url: "/tmp/futurama.jpg", category: scifi)
  Review.create(comment: "good show", score: 4.0, video: Video.first, user: User.first)
  Review.create(comment: "good show", score: 3.0, video: Video.first, user: User.first)
end

