# frozen_string_literal: true

class ChirpsController < ApplicationController
  before_action :require_signin, except: [:index, :show]
  before_action :set_chirp, only: [:edit, :update, :destroy]

  def show
    @chirp = Chirp.find(params[:id])
  end

  def index
    @pagy, @chirps = pagy(
      Chirp.order(created_at: :desc).includes(:user),
      items: 5,
    )

    @new_chirp = current_user&.chirps&.new
  end

  def new
    @chirp = current_user.chirps.new
  end

  def edit; end

  def create
    @chirp = current_user.chirps.new(chirp_params)

    if @chirp.save
      redirect_to(new_chirp_path)
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
