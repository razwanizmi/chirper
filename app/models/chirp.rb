# frozen_string_literal: true

class Chirp < ApplicationRecord
  include ActionView::RecordIdentifier

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

  after_update_commit(lambda do
    broadcast_render_later_to(
      "timeline",
      partial: "timeline/update",
      locals: { chirp: self },
    )
  end)

  after_destroy_commit(lambda do
    broadcast_remove_to(
      "timeline",
      target: dom_id(self),
    )
  end)
end
