Fabricator(:review) do
  comment {Faker::Lorem.paragraph}
  score {Faker::Number.between(from = 0.00, to = 4.00)}
end