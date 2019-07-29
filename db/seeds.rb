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

# Create client
5.times do
  Client.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    document_type: 'ce',
    document_number: '12345678'
  )
end

# Create rooms
%w[vip super luxury].each { |n| Room.new(capacity: 10, name: n).save }

# Create functions
Room.all.each do |room|
  5.times do
    Function.create(
      show_at: Time.now + 1.day,
      movie: Movie.all.sample,
      room: Room.all.sample
    )
  end
end
