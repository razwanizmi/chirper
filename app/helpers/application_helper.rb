# frozen_string_literal: true

module ApplicationHelper
  def require_signin
    return if signed_in?

    session[:intended_url] = request.url
    redirect_to signin_url
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user?(user)
    current_user == user
  end
end
