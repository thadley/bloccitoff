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
    end

    scenario 'with email missing' do
    end

    scenario 'with invalid email' do
    end
end

Warden.test_reset!

# PM signs in
# Automatically routes to todo page