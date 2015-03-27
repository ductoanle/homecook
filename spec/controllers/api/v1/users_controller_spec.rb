require 'rails_helper'

RSpec.describe Api::V1::UsersController do
  context 'sign_up' do
    let(:params){{user: {
                    username: Faker::Name.name.underscore,
                    email: Faker::Internet.free_email,
                    password: 'testing',
                    password_confirmation: 'testing'
                }}}
    it 'should create new user and return json' do
      post 'sign_up', params.merge!(format: 'json')
      expect(response).to be_success
    end
  end
  context 'profile' do
    let(:user){ FactoryGirl.create(:user) }
    before do
      warden.set_user user
    end
    it 'should be successful' do
      get 'profile', format: 'json'
      expect(response).to be_success
      expect(assigns(:user)).to eq user
    end
  end
end
