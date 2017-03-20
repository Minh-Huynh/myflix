Fabricator(:category) do
  title {Faker::Book.genre}
end