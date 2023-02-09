# frozen_string_literal: true

class ChirpsController < ApplicationController
  def index
    @pagy, @chirps = pagy(
      Chirp.order(created_at: :desc).includes(:user),
      items: 5
    )
  end
end
