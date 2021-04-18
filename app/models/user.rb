# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable, :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist

  def on_jwt_dispatch(token, payload)
    self.update(auth_token: token)
  end
end
