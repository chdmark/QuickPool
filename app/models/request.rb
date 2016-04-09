class Request < ActiveRecord::Base
  belongs_to :user
  include Geokit::Geocoders
  acts_as_mappable

  def create_coordinates(address)
    return MultiGeocoder.geocode(address)
    # geo_object = MultiGeocoder.geocode(address)
    # return [geo_object.lat, geo_object.lng]
  end
end
