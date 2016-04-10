class Trip < ActiveRecord::Base
  belongs_to :driver, class_name: "User"
  belongs_to :rider, class_name: "User"
  acts_as_mappable

  def address2google
    origin_string = self.rider_origin_loc.split.join('+')
    destination_string = self.destination_loc.split.join('+')
    url_string = origin_string + "/" + destination_string
    return url_string
  end

  private


end
