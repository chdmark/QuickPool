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

		it 'will not create a new user if params are missing' do 
			expect{post :create, {user: {name: ''}}}.to change{User.count}.by(0)
			expect(response).to redirect_to new_user_path

			
		end
	end

	describe '#show' do 
		it 'renders the user display page if the user is logged in' do 
			session[:user_id] = other_user.id
			get :show, id: other_user.id
			expect(response).to render_template(:show)
		end

		it 'redirects to root pth if the user is not the current user' do 
			get :show, id: other_user.id
			expect(response).to redirect_to root_path
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
	
	describe '#update' do 
		

		it 'will update the user and redirect to user page when given correct parameters' do 
			
			session[:user_id] = test_user.id
			put :update, id: test_user, :user => {first_name: "Chris", last_name: "Mark", password_digest: test_user.password_digest, phone_number: test_user.phone_number, email: test_user.email}
			expect(response).to redirect_to user_path(test_user)
		end

		context 'when given invalid params' do 
			let :updates do 
				{
					first_name: ''
				}
			end

			it 'should render the edit screen again with errors if the model does not save' do 
			
				put :update, id: test_user.id, :user => updates
				expect(response).to redirect_to edit_user_path(test_user.id)
			end
		end

	end

end
