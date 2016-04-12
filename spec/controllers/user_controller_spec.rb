require 'rails_helper'

RSpec.describe UserController, type: :controller do
	describe '#new' do 
		it 'should load new form for user sign up' do 
			get :new 
			expect(response).to render_template(:new)
		end
	end

	describe '#create' do 
		let (:test_user){FactoryGirl.create(:user)}
		it 'creates a new user and changes count by 1' do 
			expect{ post :create, user: test_user.attributes}.to change{User.count}.by(1)
		end
	
	end

end
