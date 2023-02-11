# frozen_string_literal: true

class ChirpsController < ApplicationController
  before_action :require_signin, except: :index
  before_action :set_chirp, only: [:show, :edit, :update, :destroy]

  def show; end

  def index
    @pagy, @chirps = pagy(
      Chirp.order(created_at: :desc).includes(:user),
      items: 5,
    )

    @new_chirp = current_user&.chirps&.new
  end

  def edit; end

  def create
    @chirp = current_user.chirps.new(chirp_params)

    if @chirp.save
      @new_chirp = current_user.chirps.new
      flash.now[:notice] = "You just chirped"
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def update
    if @chirp.update(chirp_params)
      flash.now[:notice] = "Successfully updated a chirp"
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @chirp.destroy
    flash.now[:notice] = "Successfully removed a chirp"
  end

  private

  def set_chirp
    @chirp = current_user.chirps.find(params[:id])
  end

  def chirp_params
    params.require(:chirp).permit(:content)
  end
end
