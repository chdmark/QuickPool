require 'rails_helper'

RSpec.describe Trip, type: :model do
  let(:trip) {FactoryGirl.build :trip}

  describe 'model functionality' do
    context 'address2google' do
      it 'generates the correct google maps address' do
        address = trip.address2google
        expect(address).to eq("261+Molimo+Blvd/633+Folsom+Street")
      end
    end
  end
end
