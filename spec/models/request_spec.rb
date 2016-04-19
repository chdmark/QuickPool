require 'rails_helper'

RSpec.describe Request, type: :model do
  let(:user) {FactoryGirl.create :user, first_name: "Driver"}
  let(:user2) {FactoryGirl.create :user, first_name: "Rider"}
  let(:driver) {FactoryGirl.build :request, driver: "true", user_id: user.id}
  let(:rider) {FactoryGirl.build :request, driver: "false", user_id: user2.id}
  let(:good_request) {FactoryGirl.build :request, user_id: user.id}
  let(:no_destination) {FactoryGirl.build :request, user_id: user.id, destination_loc: ""}
  let(:no_origin) {FactoryGirl.build :request, user_id: user.id, origin_loc: ""}
  let(:bad_driver) {FactoryGirl.build :request, user_id: user.id, driver: "maybe"}


  describe 'validations' do
    it 'creates a request on success' do
      expect{good_request.save}.to change{Request.count}.by(1)
    end
    it 'fails to create a request with no destination' do
      no_destination.save
      expect(no_destination.errors[:destination_loc]).to eq(["can't be blank"])
    end
    it 'fails to create a request with no origin' do
      no_origin.save
      expect(no_origin.errors[:origin_loc]).to eq(["can't be blank"])
    end
    it 'fails to create a request with a fudged driver' do
      bad_driver.save
      expect(bad_driver.errors[:driver]).to eq(["can't be blank"])
    end
  end

  describe 'functionality' do
    context 'request pairing' do
      it 'creates a trip when 2 matches are found' do
        driver.save
        rider.save
        expect{rider.check_for_matches}.to change{Trip.count}.by(1)
      end
      it 'does not create a trip when the origin location distance is too large' do
        driver[:origin_loc] = "188 McKnight Rd."
        driver.save
        rider.save
        expect{rider.check_for_matches}.to change{Trip.count}.by(0)
      end
      it 'does not create a trip when the destination location distance is too large' do
        driver[:destination_loc] = "188 McKnight Rd."
        driver.save
        rider.save
        expect{rider.check_for_matches}.to change{Trip.count}.by(0)
      end
      it 'updates the driver match to complete' do
        driver.save
        rider.save
        rider.check_for_matches
        expect(rider[:match]).to be true
      end
      it 'updates the active to false' do
        driver.save
        rider.save
        rider.check_for_matches
        expect(rider[:active]).to be false
      end
    end
  end
end
