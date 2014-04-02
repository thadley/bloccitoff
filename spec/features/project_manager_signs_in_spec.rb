require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

user = FactoryGirl.create(:user)
user.confirmed_at = Time.now
user.save

feature 'signs in to app' do
    scenario 'Successfully' do
       login_as(user, :scope => :user)
       visit todos_path
       expect( page ).to have_content('Sign out')
       expect( page ).to have_content('Days left')
    end

    scenario 'with password missing' do
      sign_in_with 'email@example.com', ''
      expect( page ).to have_content('Sign in')
    end

    scenario 'with email missing' do
      sign_in_with '', 'password'
      expect( page ).to have_content('Sign in')
    end

  def sign_in_with (email, password)
    visit new_user_session_path
    fill_in 'Email', with: 'email@example.com'
    fill_in 'Password', with: 'password'
  end
end

Warden.test_reset!

# Feature: PM signs in to app

# Scenario: Successfully
#   Automatically routes to todo page

# Scenario: with password missing
#   Stays on login page

# Scenario: with email missing
#   Stays on login page