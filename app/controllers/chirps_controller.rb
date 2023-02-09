# frozen_string_literal: true

class ChirpsController < ApplicationController
  before_action :require_signin, except: :index
  before_action :set_chirp, only: %i[show edit update destroy]

  def show; end

  def index
    @pagy, @chirps = pagy(
      Chirp.order(created_at: :desc).includes(:user),
      items: 5
    )
  end

  def edit; end

  def update
    if @chirp.update(chirp_params)
      render :show
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @chirp.destroy
  end

  private

  def set_chirp
    @chirp = current_user.chirps.find(params[:id])
  end

  def chirp_params
    params.require(:chirp).permit(:content)
  end
end
