require 'rails_helper'

RSpec.describe User, type: :model do
  let(:good_user) {FactoryGirl.build :user}
  let(:no_pass) {FactoryGirl.build :user, password_digest: "" }
  let(:no_first_name) {FactoryGirl.build :user, first_name: ""}
  let(:no_last_name) {FactoryGirl.build :user, last_name: ""}
  let(:no_phone_number) {FactoryGirl.build :user, phone_number: ""}
  describe 'validations' do
    context 'will raise an error' do
      it 'when the password is too short' do
        no_pass.save
        expect(no_pass.errors[:password_digest]).to eq(["is too short (minimum is 5 characters)"])
      end
      it 'when the first name is blank' do
        no_first_name.save
        expect(no_first_name.errors[:first_name]).to eq(["can't be blank"])
      end
      it 'when the last name is blank' do
        no_last_name.save
        expect(no_last_name.errors[:last_name]).to eq(["can't be blank"])
      end
      it 'when the phone number is blank' do
        no_phone_number.save
        expect(no_phone_number.errors[:phone_number]).to eq(["can't be blank"])
      end
    end
    it 'successfully save on a good user' do
      expect{good_user.save}.to change{User.count}.by(1)
    end
  end
end
