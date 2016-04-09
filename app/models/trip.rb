class Trip < ActiveRecord::Base
  belongs_to :driver, class_name: "User"
  belongs_to :rider, class_name: "User"

  # acts_as_mappable
end
