require 'rails_helper'

RSpec.describe UserController, type: :controller do
	describe '#new' do 
		it 'should load new form for user sign up' do 
			get :new 
			expect(response).to render_template(:new)
		end
	end
end
