class User < ActiveRecord::Base
  has_many :requests
  has_many :trips, foreign_key: :driver_id
  has_many :trips, foreign_key: :rider_id
end
