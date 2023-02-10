# frozen_string_literal: true

class Chirp < ApplicationRecord
  belongs_to :user

  validates :content,
    presence: true,
    length: { minimum: 1, maximum: 280 }
end
