require 'rails_helper'

RSpec.describe UserController, type: :controller do
	let (:other_user){FactoryGirl.create(:user)}
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

		# it 'will not create a new user if params are missing' do 


			
		# end
	end

	describe '#show' do 
		it 'renders the user display page' do 
			session[:user_id] = other_user.id
			get :show, id: other_user.id
			expect(response).to render_template(:show)
		end
	end
	

end
