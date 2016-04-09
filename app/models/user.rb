class User < ActiveRecord::Base
  has_many :requests
  has_many :driven_trips, foreign_key: :driver_id, class_name: 'Trip'
  has_many :ridden_trips, foreign_key: :rider_id, class_name: 'Trip'
end
