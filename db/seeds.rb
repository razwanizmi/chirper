# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

return if Chirp.all.count > 0

MOVIES_GENERATOR = [
  Faker::Movies::HarryPotter,
  Faker::Movies::LordOfTheRings,
  Faker::Movies::StarWars,
].freeze

20.times do
  User.create!(
    username: MOVIES_GENERATOR.sample.character.gsub(/[^a-zA-Z]/, ""),
    password: "rootroot",
  )
rescue StandardError
  retry
end

users = User.all

400.times do
  Chirp.create!(
    user: users.sample,
    content: MOVIES_GENERATOR.sample.quote,
  )
end
