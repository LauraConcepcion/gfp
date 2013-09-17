# encoding: utf-8
require "spec_helper"

feature "Profile", "" do
  background do
    @user = FactoryGirl.create(:teacher, :email => "usuario@usabi.es")
    sign_in_as_user(@user)
  end

  scenario "Wee need at least one profile", :js => true do
    visit classrooms_path
    current_path.should == profiles_path
    page.should have_content "Debe crear al menos un perfil"
  end
end
