require 'rails_helper'

RSpec.describe UserController, type: :controller do
	describe '#new' do 
		it 'should load new form for user sign up' do 
			get :new 
			expect(response).to render_template(:new)
		end
	end

	describe '#create' do 
		let (:user_params){FactoryGirl.create(:user)}
		it 'creates a new user' do 
			expect{ post :create, user: user_params.attributes}.to change{User.count}.by(1)
		end
	end

end
