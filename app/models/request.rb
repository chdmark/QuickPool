class Request < ActiveRecord::Base
  belongs_to :user
  include Geokit::Geocoders
  acts_as_mappable

  def check_for_matches
    possible_matches = Request.where(match: false, driver: !self.driver)
    possible_matches.each do |request|
      if MultiGeocoder.geocode(self.origin_loc).distance_to(request.origin_loc) <= 1
        if MultiGeocoder.geocode(self.destination_loc).distance_to(request.destination_loc) <= 1
          p "*" * 100
          p "*" * 100
          send_text_message(User.find(self.user_id).phone_number)
          send_text_message(User.find(request.user_id).phone_number)
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

  def send_text_message(number_to_send_to)
    # number_to_send_to = params[:number_to_send_to]
    p "*" * 80
    p "Sending Message"
    twilio_sid = "ACe2ac50d1fadcd66bdce01990ae9bb474"
    twilio_token = "851c6c93112537f05fbaaa5915ab8242"
    twilio_phone_number = "7075631899"

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => "You got a match! View your profile for details! -QuickPool"
    )
  end
end
