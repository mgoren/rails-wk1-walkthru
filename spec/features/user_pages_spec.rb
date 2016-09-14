require 'rails_helper'

describe "user registration and sign in process" do

  it "registers a user" do
    visit new_user_registration_path
    fill_in 'Email', :with => 'test@test.com'
    fill_in 'Username', :with => 'test'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Sign up'
    expect(page).to have_content 'You have signed up successfully.'
  end

  it "signs in a valid user" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Login', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

end
