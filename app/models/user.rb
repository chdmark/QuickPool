class User < ActiveRecord::Base
  has_many :requests
  has_many :driven_trips, foreign_key: :driver_id, class_name: 'Trip'
  has_many :ridden_trips, foreign_key: :rider_id, class_name: 'Trip'
  validates :first_name, :last_name, :email, :phone_number, presence: true
  validates :password_digest, :length => { :minimum => 5 }

  has_secure_password
end
