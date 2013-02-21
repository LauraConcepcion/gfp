require 'spec_helper'

feature "Aacces" do
  before (:each) do
    @user = FactoryGirl.create(:user)
    visit "/users/sign_in"
    fill_in "Email",    :with => @user.email
    fill_in "Password", :with => "password"
    click_button "Sign in"
    page.should have_content("Browse the documentation Rails Guides")
  end

  scenario "GET /aacces", :js => true do
    visit '/admin/aacce'
    click_link('Add new')
    fill_in "Name", :with => "Canarias"
    click_button('_save')
    page.should have_content('Aacce successfully created ')
  end

end
