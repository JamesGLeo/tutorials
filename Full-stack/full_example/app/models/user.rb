class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  # validates :password, presence: true, on: :create
  has_many :todos

end
