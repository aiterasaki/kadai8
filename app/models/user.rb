class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
   :registerable,
   :recoverable, :rememberable,
   :trackable,
   :validatable

  # validates :name, presence: true
  # validates :telephone, presence: true
  validates :email, presence: true
  # validates :postal_code, presence: true
  # validates :street_address, presence: true


  has_many :posts
  has_one :cart
  has_one :order




end
