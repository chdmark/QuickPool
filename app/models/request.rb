class Request < ActiveRecord::Base
  belongs_to :user
  include Geokit::Geocoders
  acts_as_mappable

  def check_for_matches
    possible_matches = Request.where(match: false, driver: !self.driver)
    possible_matches.each do |request|
      if MultiGeocoder.geocode(self.origin_loc).distance_to(request.origin_loc) <= 1
        if MultiGeocoder.geocode(self.destination_loc).distance_to(request.destination_loc) <= 1
          if self.driver
            Trip.create(rider_id: request.user_id, driver_id: self.user_id, rider_origin_loc: request.origin_loc, driver_origin_loc: self.origin_loc, destination_loc: request.destination_loc)
          else
            Trip.create(rider_id: self.user_id, driver_id: request.user_id, rider_origin_loc: self.origin_loc, driver_origin_loc: request.origin_loc, destination_loc: self.destination_loc)
          end
          self.match = true
          self.save
          request.match = true
          request.save
          return true
        end
      end
    end
    return false
  end

end
