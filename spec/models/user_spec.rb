require 'rails_helper'

RSpec.describe User do
  let!(:user){FactoryGirl.create(:user)}
  let(:params){{
      username: Faker::Name.name.underscore,
      email: Faker::Internet.free_email,
      password: 'testing',
      password_confirmation: 'testing'
  }}

  it 'should be able to create user' do
    expect(User.new(params)).to be_valid
  end

  context 'validations' do
    it 'should validate presence of parameters' do
      [:username, :email, :password, :password_confirmation].each do |p|
        expect(User.new(params.except(p))).not_to be_valid
      end
    end
    it 'should make sure certain attribute is unique' do
      [:username, :email].each do |p|
        expect(User.new(params.merge!(p => user.read_attribute(p))))
      end
    end
    it 'should only accept correct format for email' do 
      expect(User.new(params.merge!(email: 'testing_bad_email'))).not_to be_valid
    end
  end
end
