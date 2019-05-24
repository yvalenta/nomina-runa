class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :asistencias

  ROLES = %w[ADMIN EMPLOYEE]

  def self.get_user(id)
    find(id).name
  end


end
