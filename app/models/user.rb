# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true,
                       uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 8 }

  def avatar_url
    "https://api.dicebear.com/5.x/fun-emoji/svg?seed=#{username}"
  end
end
