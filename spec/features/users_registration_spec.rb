# encoding: utf-8
require 'spec_helper'

feature "User registration and password recovery", "" do
  fixtures :users

  scenario "Register as user" do
    visit root_url
    click_link "Sign up"
    fill_in "Name", :with => "Rose Garden"
    fill_in "E-mail", :with => "rosegarden@customers.com"
    fill_in "user[password]", :with => "12345678"
    fill_in "user[password_confirmation]", :with => "12345678"
    click_button "Sign up"
    page.should have_content "A message with a confirmation link has been sent to your email address. Please open the link to activate your account."

    # Follow link in instructions e-mail.
    open_email("rosegarden@customers.com")
    current_email.click_link "Confirm my account"
    page.should have_content "Your account was successfully confirmed. You are now signed in."
    page.should_not have_content "Sign up"
  end

  scenario "Recover password" do
    visit root_url
    click_link "Login"
    click_link "Forgot password?"
    fill_in "E-mail", :with => users(:bob).email
    click_button "Send"
    page.should have_content "You will receive an email with instructions about how to reset your password in a few minutes."
    current_path.should == new_user_session_path

    # Follow link in instructions e-mail.
    open_email(users(:bob).email)
    current_email.click_link "Change my password"
    fill_in "user[password]", :with => "12345678"
    fill_in "user[password_confirmation]", :with => "12345678"
    click_button "Change"
    page.should have_content "Your password was changed successfully. You are now signed in."
    current_path.should == root_path
  end

end
