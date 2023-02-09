# frozen_string_literal: true

class ChirpsController < ApplicationController
  def index
    @chirps = Chirp.all.limit(50)
  end
end
