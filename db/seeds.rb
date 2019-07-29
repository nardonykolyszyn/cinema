# frozen_string_literal: true

# Create movies
MOVIE_GENDERS = %i[horror romantic comedy adventure action].freeze

20.times do
  Movie.create(
    name: Faker::FunnyName.unique.name,
    gender: MOVIE_GENDERS.sample,
    year: rand((1990..Time.now.year))
  )
end
