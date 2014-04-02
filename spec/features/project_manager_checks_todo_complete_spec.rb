require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

user = FactoryGirl.create(:user)
user.confirmed_at = Time.now
user.save

feature 'PM checks todo as complete to delete it', js: true do
    before do
        login_as(user, :scope => :user)
        visit new_todo_path
        fill_in 'Description', with: 'Meet up with the team'
        click_button 'Save'
        expect( page ).to have_content('Your new todo was saved')
        expect( page ).to have_content('Meet up with the team')
    end

    scenario 'Successfully' do
        find(:css, ".todoCheckbox").click
        page.driver.browser.switch_to.alert.accept
        expect( page ).to have_no_content('Meet up with the team')
    end

    scenario 'cancels delete' do
        find(:css, ".todoCheckbox").click
        page.driver.browser.switch_to.alert.dismiss
        expect( page ).to have_content('Meet up with the team')
    end
end

Warden.test_reset!

# Feature: PM checks todo as complete to delete it

# Scenario: Successfully

#   PM goes to the todo index list page
#   PM selects check box next to todo item
#   When checked, PM confirms delete 
#   Todo item is deleted from list
#   PM sees message that todo is complete

# Scenario: cancels delete

#   PM goes to the todo index list page
#   PM selects check box next to todo item
#   When checked, PM cancels delete
#   Checkbox is unchecked, todo item remains on list
