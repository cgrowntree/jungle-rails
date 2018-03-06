require 'rails_helper'
require 'spec_helper'
require 'user'

RSpec.describe User, type: :model do
  before :example do
    User.destroy_all
  end 
    
  describe 'Saves' do
    it 'ensures all saves' do
      users = User.new({
        name: "Christopher", 
        email: "chris@rowntree.co", 
        password: "password",
        password_confirmation: "password"
      })
      users.save
      expect(users.id).to be_truthy
    end
  end
  
  describe 'Validations' do
  # validation tests/examples here
    it 'ensures name presence' do
      users = User.new({
        email: "chris@rowntree.co", 
        password: "password",
        password_confirmation: "password"
      })
      users.save
      expect(users.id).to be_nil
    end
  
    it 'ensures email presence' do
      users = User.new({
        name: "Christopher", 
        password: "password",
        password_confirmation: "password"
      })
      users.save
      expect(users.id).to be_nil
    end
  
    it 'ensures password presence' do
      users = User.new({
        name: "Christopher", 
        email: "chris@rowntree.co"
      })
      users.save
      expect(users.id).to be_nil
    end

    it 'ensures password match' do
      users = User.new({
        name: "Christopher", 
        email: "chris@rowntree.co",
        password: "password",
        password_confirmation: "nomatch"
      })
      users.save
      expect(users.id).to be_nil
    end

  end

  describe '.authenticate_with_credentials' do
    it 'ensure authentication with proper credentials' do
      @user = User.new({
        name: "Christopher", 
        email: "chris@rowntree.co", 
        password: "password",
        password_confirmation: "password"
      })
      @user.save!
      compare = @user == @user.authenticate_with_credentials("chris@rowntree.co", "password")
      expect(compare).to be_truthy
  end

    it 'ensure authentication fails with incorrect password' do
      @user = User.new({
        name: "Christopher", 
        email: "chris@rowntree.co", 
        password: "password",
        password_confirmation: "password"
      })
      @user.save!
      compare = @user == @user.authenticate_with_credentials("chris@rowntree.co", "123")
      expect(compare).to be_falsey
    end

    it 'ensure creation with extra spaces on both sides of email' do
      @user = User.new({
        name: "Christopher", 
        email: "chris@rowntree.co", 
        password: "password",
        password_confirmation: "password"
      })
      @user.save!
      compare = @user == @user.authenticate_with_credentials(" chris@rowntree.co ", "password")
      expect(compare).to be_truthy
    end

    it 'ensure creation with extra spaces on both sides of email' do
      @user = User.new({
        name: "Christopher", 
        email: "chris@rowntree.co", 
        password: "password",
        password_confirmation: "password"
      })
      @user.save!
      compare = @user == @user.authenticate_with_credentials("chris@ROWNTREE.co", "password")
      expect(compare).to be_truthy
    end

  end

end
