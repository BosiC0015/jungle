require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should be valid with email, first name, last name, password and password_comfirmation' do 
      @new_user = User.create({
        firstname: 'Firstname',
        lastname: 'Lastname',
        email: 'user.example@gmail.com',
        password: '0987',
        password_confirmation: '0987'
      })
      expect(@new_user).to be_valid
    end

    it 'should be created with matching password and password_confirmation' do
      @new_user = User.create({
        firstname: 'Firstname',
        lastname: 'Lastname',
        email: 'user.example@gmail.com',
        password: '0987',
        password_confirmation: '0987'
      })
      expect(@new_user).to be_valid
    end

    it 'should have unique and not case sensitive emails' do
      @existing_user = User.create({
        firstname: 'Firstname',
        lastname: 'Lastname',
        email: 'user.example@gmail.com',
        password: '0987',
        password_confirmation: '0987'
      })
      @new_user = User.create({
        firstname: 'FirstName',
        lastname: 'LastName',
        email: 'USER.EXAMPLE@gmail.com',
        password: '1234',
        password_confirmation: '1234'
      })
      expect(@new_user).to_not be_valid
    end

    it 'should have a minimum password length' do
      @new_user = User.create({
        firstname: 'Firstname',
        lastname: 'Lastname',
        email: 'user.example@gmail.com',
        password: '123',
        password_confirmation: '123'
      })
      expect(@new_user).to_not be_valid
    end
    
  end
  

  describe '.authenticate_with_credentials' do

    before do 
      @user = User.create({
        firstname: 'Jungle',
        lastname: 'User',
        email: 'example@domain.com',
        password: '012345',
        password_confirmation: '012345'
      })
      @user.save
    end

    it 'should have functioning authenticate_with_credentials method' do
      email = 'example@domain.com'
      password = '012345'
      @auth = User.authenticate_with_credentials(email, password)
      expect(@auth.email).to eq(@user.email)
    end

    it 'should be successfully authenticated and ignore spaces before and/or after email address' do
      email = '  example@domain.com '
      password = '012345'
      @auth = User.authenticate_with_credentials(email, password)
      expect(@auth.email).to eq(@user.email)
    end
    
    it 'should be successfully authenticated when the case of email is wrong' do
      email = 'EXAMPLe@DOMAIN.CoM'
      password = '012345'
      @auth = User.authenticate_with_credentials(email, password)
      expect(@auth.email).to eq(@user.email)
    end

  end
  
end
