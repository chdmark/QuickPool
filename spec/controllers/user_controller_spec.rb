require 'rails_helper'

RSpec.describe UserController, type: :controller do
	let (:test_user){FactoryGirl.create(:user)}
	let (:other_user){FactoryGirl.create(:user)}
	describe '#new' do 
		it 'should load new form for user sign up' do 
			get :new 
			expect(response).to render_template(:new)
		end
	end

	describe '#create' do 
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

	describe "#edit" do 
		it 'renders the edit page if the user is logged in' do
			session[:user_id] = other_user.id
			get :edit, id: other_user.id
			expect(response).to render_template(:edit)
		end

		it 'redirects to root path if the user is not the current user' do 
			get :edit, id: other_user.id
			expect(response).to redirect_to root_path

		end

	end
	

end
