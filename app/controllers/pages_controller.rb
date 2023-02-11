# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :require_signin, only: :profile

  def about; end

  def profile; end
end
