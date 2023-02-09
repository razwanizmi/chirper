# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

MOVIES_GENERATOR = [
  Faker::Movies::HarryPotter,
  Faker::Movies::LordOfTheRings,
  Faker::Movies::StarWars
].freeze

20.times do
  movie = MOVIES_GENERATOR.sample

  user = User.create!(
    username: movie.character.gsub(/[^a-zA-Z]/, ''),
    password: 'rootroot'
  )

  20.times do
    user.chirps.create!(content: MOVIES_GENERATOR.sample.quote)
  end
rescue StandardError
  retry
end
