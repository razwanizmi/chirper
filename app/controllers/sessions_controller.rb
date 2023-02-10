# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:username])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Successfully signed in"
      redirect_to(session[:intended_url] || root_path)
      session[:intended_url] = nil
    else
      flash.now[:alert] = "Invalid email/password combination"
      render(:new, status: :unprocessable_entity)
    end
  end

  def destroy
    flash[:notice] = "Successfully signed out"
    session[:user_id] = nil
    redirect_to(root_url)
  end
end
