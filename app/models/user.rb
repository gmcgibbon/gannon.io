class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,
  # :registerable, :recoverable, and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable,
         :validatable#, :registerable, :recoverable

  validates_presence_of :name

  enum role: [:reader, :writer, :admin]

end
