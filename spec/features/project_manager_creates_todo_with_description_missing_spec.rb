require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

user = FactoryGirl.create(:user)
user.confirmed_at = Time.now
user.save

feature 'Creates TODO with description missing' do
    scenario 'Unsuccessfully' do
        login_as(user, :scope => :user)
        visit new_todo_path
        fill_in 'Description', with: ''
        click_button 'Save'
        expect( page ).to have_content('There was an error saving your todo')
    end
end

Warden.test_reset!

# Goes to the TODO creation page
# Submits a new TODO without description
# Sees an error message