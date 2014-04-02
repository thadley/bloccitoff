require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

user = FactoryGirl.create(:user)
user.confirmed_at = Time.now
user.save

feature 'Project manager creates todo' do
    before :each do
        login_as(user, :scope => :user)
        visit new_todo_path
    end

    scenario 'Successfully' do
        fill_in 'Description', with: 'Meet up with the team'
        click_button 'Save'
        expect( page ).to have_content('Your new todo was saved')
        expect( page ).to have_content('Meet up with the team')
    end

    scenario 'with description missing' do
        fill_in 'Description', with: ''
        click_button 'Save'
        expect( page ).to have_content('There was an error saving your todo')
    end
end

Warden.test_reset!

# Feature: Creating a todo

# Scenario: Successfully
#   PM goes to the TODO creation page
#   PM submits new TODO description
#   PM sees confirmation message
#   PM sees newly saved TODO

# Scenario: with description missing
#   Goes to the TODO creation page
#   Submits a new TODO without description
#   Sees an error message

# User story

# As a Project Manager
# In order to keep track of a project's tasks
# I want to create TODOs
# --> Project manager creates a TODO