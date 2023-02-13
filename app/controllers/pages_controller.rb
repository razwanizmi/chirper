# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :require_signin, only: :profile

  def about; end

  def profile; end

  def reset
    Rails.application.executor.wrap do
      chirps_count = Chirp.all.count

      if chirps_count > 400
        Chirp.last(chirps_count - 400).each(&:destroy)
      end
    end

    render(plain: "Successfully reset chirps")
  end
end
