# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

MOVIES_GENERATOR = [
  Faker::Movies::HarryPotter,
  Faker::Movies::LordOfTheRings,
  Faker::Movies::StarWars
].freeze

50.times do
  User.create!(
    username: MOVIES_GENERATOR.sample.character.gsub(/[^a-zA-Z]/, ''),
    password: 'rootroot'
  )
rescue StandardError
  retry
end
