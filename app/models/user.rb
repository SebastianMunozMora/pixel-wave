class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = %w[admin editor user reader].freeze

  def admin?
    role == "admin"
  end

  def editor?
    role == "editor"
  end

  def user?
    role == "user"
  end
end
