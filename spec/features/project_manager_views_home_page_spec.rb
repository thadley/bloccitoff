require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

user = FactoryGirl.create(:user)
user.confirmed_at = Time.now
user.save

feature 'Views home page' do
    scenario 'Successfully' do
       login_as(user, :scope => :user)
       visit todos_path
       expect( page ).to have_content('Days left')
       click_link('Home')
       expect( page ).to have_content('to keep you focused')
    end
end

Warden.test_reset!

# Feature: PM views home page

# Scenario: Successfully
#   PM signs in 
#   Automatically routes to todo page
#   PM navigates to home page