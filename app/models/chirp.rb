# frozen_string_literal: true

class Chirp < ApplicationRecord
  belongs_to :user

  validates :content,
    presence: true,
    length: { minimum: 1, maximum: 280 }

  after_create_commit(lambda do
    broadcast_render_later_to(
      "timeline",
      partial: "timeline/create",
      locals: { chirp: self },
    )
  end)
end
